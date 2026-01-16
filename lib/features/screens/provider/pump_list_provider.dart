import 'dart:async';

import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/models/src/pump_detail_model/pump_detail_model.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

class PumpListProvider extends ChangeNotifier {
  List<PumpDetailModel> _pumps = [];
  List<PumpDetailModel> get pumps => _pumps;

  final LocalPreferences _prefs = LocalPreferences();

  // ---------------- ADD PUMP ----------------
  void addPump(PumpDetailModel pump) {
    _pumps = [..._pumps, pump];
    notifyListeners();
  }

  // ---------------- SWITCH ON (UI + LOCAL) ----------------
  Future<void> switchOn(String pumpId) async {
    await _prefs.init();

    _pumps = _pumps.map((p) {
      if (p.pumpId == pumpId) {
        return p.copyWith(
          isOn: true,
          startTime: DateTime.now(),
          logs:[
            PumpLogModel(action: 'ON', time:DateTime.now()),
            ...p.logs,
          ],
        );
      }
      return p;
    }).toList();

    await _prefs.setPumpState(pumpId: pumpId, isOn: true);
    notifyListeners();
  }

  // ---------------- SWITCH OFF (UI + LOCAL) ----------------
  Future<void> switchOff(String pumpId) async {
    await _prefs.init();

    _pumps = _pumps.map((p) {
      if (p.pumpId == pumpId) {
        return p.copyWith(
          isOn: false,
          startTime: null,
          endTime: null,
          logs:[
            PumpLogModel(action: 'OFF', time:DateTime.now()),
            ...p.logs,
          ],

        );
      }
      return p;
    }).toList();

    await _prefs.setPumpState(pumpId: pumpId, isOn: false);
    notifyListeners();
  }

  // ---------------- SCHEDULE START (BACKGROUND SAFE) ----------------
  Future<void> startPumpAtSelectedTime({
    required TimeOfDay selectedTime,
    required String pumpId,
  }) async {
    final scheduledTime = getSafeScheduledTime(selectedTime);
    final delay = scheduledTime.difference(DateTime.now());

    // UI update
    _pumps = _pumps.map((p) {
      if (p.pumpId == pumpId) {
        return p.copyWith(startTime: scheduledTime);
      }
      return p;
    }).toList();
    notifyListeners();

    // ❌ Cancel old tasks
    await Workmanager().cancelByUniqueName('pump_on_$pumpId');
    await Workmanager().cancelByUniqueName('pump_off_$pumpId');

    // 🔥 Near time → Foreground Timer
    if (delay.inSeconds <= 60) {
      Future.delayed(delay, () => switchOn(pumpId));
      Future.delayed(
        delay + const Duration(hours: 1),
            () => switchOff(pumpId),
      );
      return;
    }

    // 🔥 Background
    await Workmanager().registerOneOffTask(
      'pump_on_$pumpId',
      'pumpOnTask',
      initialDelay: delay,
      inputData: {'pumpId': pumpId},
      existingWorkPolicy: ExistingWorkPolicy.replace,
    );

    await Workmanager().registerOneOffTask(
      'pump_off_$pumpId',
      'pumpOffTask',
      initialDelay: delay + const Duration(hours: 1),
      inputData: {'pumpId': pumpId},
      existingWorkPolicy: ExistingWorkPolicy.replace,
    );
  }
  Timer? _stateSyncTimer;

  void startAutoSync() {
    _stateSyncTimer?.cancel();
    _stateSyncTimer = Timer.periodic(
      const Duration(seconds: 5),
          (_) => loadPumpStatesAndLogs(),
    );
  }

  void stopAutoSync() {
    _stateSyncTimer?.cancel();
  }

  Future<void> stopPumpAtSelectedTime({
    required TimeOfDay selectedTime,
    required String pumpId,
  }) async {
    final scheduledTime = getSafeScheduledTime(selectedTime);
    final delay = scheduledTime.difference(DateTime.now());

    // UI update
    _pumps = _pumps.map((p) {
      if (p.pumpId == pumpId) {
        return p.copyWith(endTime: scheduledTime);
      }
      return p;
    }).toList();
    notifyListeners();

    // ❌ Cancel old OFF task
    if(isAndroid || isIos) await Workmanager().cancelByUniqueName('pump_off_$pumpId');

    // 🔥 Near time
    if (delay.inSeconds <= 60) {
      Future.delayed(delay, () async{
        return switchOff(pumpId);
      });
      return;
    }

    // 🔥 Background OFF
   if(isAndroid || isIos) {
     await Workmanager().registerOneOffTask(
      'pump_off_$pumpId',
      'pumpOffTask',
      initialDelay: delay,
      inputData: {'pumpId': pumpId},
      existingWorkPolicy: ExistingWorkPolicy.replace,
    );
   }
  }


  void _scheduleWithTimer(
      String pumpId,
      Duration delay,
      Duration autoOff,
      ) {
    Future.delayed(delay, () => switchOn(pumpId));
    Future.delayed(delay + autoOff, () => switchOff(pumpId));
  }



  Future<void> schedulePump({
    required String pumpId,
    required DateTime startTime,
    Duration autoOff = const Duration(hours: 1),
  }) async {
    final delay = startTime.difference(DateTime.now());
    if (delay.isNegative) return;

    if (isAndroid || isIos) {
      _scheduleWithWorkmanager(pumpId, delay, autoOff);
    } else {
      _scheduleWithTimer(pumpId, delay, autoOff);
    }
  }
  // ---------------- LOAD STATE ON APP START ----------------
  Future<void> loadPumpStatesAndLogs() async {
    await _prefs.init();

    _pumps = _pumps.map((p) {
      final isOn = _prefs.getPumpState(p.pumpId.toString());

      return p.copyWith(
          isOn: isOn,
        logs: _prefs.getPumpLogs(p.pumpId!)
      );
    }).toList();

    notifyListeners();
  }
}
Future<void> _scheduleWithWorkmanager(
    String pumpId,
    Duration delay,
    Duration autoOff,
    ) async {
  await Workmanager().registerOneOffTask(
    'pump_on_$pumpId',
    'pumpOnTask',
    initialDelay: delay,
    inputData: {'pumpId': pumpId},
    existingWorkPolicy: ExistingWorkPolicy.replace,
  );

  await Workmanager().registerOneOffTask(
    'pump_off_$pumpId',
    'pumpOffTask',
    initialDelay: delay + autoOff,
    inputData: {'pumpId': pumpId},
    existingWorkPolicy: ExistingWorkPolicy.replace,
  );
}



