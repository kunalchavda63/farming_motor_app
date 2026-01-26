import 'dart:async';

import 'package:dio/dio.dart';
import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/models/src/api_state.dart';
import 'package:farming_motor_app/core/utilities/src/extensions/logger/logger.dart';
import 'package:farming_motor_app/features/admin/admin_service/admin_service.dart';

class AdminProvider extends ChangeNotifier {
  ApiState<List<UserModel>> userListState = ApiState.initial();
  ApiState<List<PumpDetailModel>> userListPumpState = ApiState.initial();
  ApiState<Map<String,dynamic>> addPumpState = ApiState.initial();

  SortOrder _sortOrder = SortOrder.az;
  SortOrder get  sortOrder => _sortOrder;


  Future<void> loadUsers() async {
    userListState = ApiState.loading();
    notifyListeners();

    try {
      final response = await fetchUserList();
      await Future<void>.delayed(const Duration(milliseconds: 800));

      if (response.success && response.data != null) {
        userListState = ApiState.success(response.data!);
        _applySorting();

      } else {
        userListState = ApiState.error(response.message ?? 'Failed to load users');
      }
    } on DioException catch (e) {
      userListState = ApiState.error(e.toString());
    }

    notifyListeners();
  }
  Future<void> addPumps(PumpDetailModel pumpDetails) async {
    addPumpState = ApiState.loading();
    notifyListeners();

    try {
      final response = await addPump(pumpDetails);
      logger.e(response);

      if (response.success && response.data != null) {
        addPumpState = ApiState.success(response.data!);
      } else {
        addPumpState =
            ApiState.error(response.message ?? 'Failed to add pump');
      }
    } on DioException catch (e) {
      addPumpState = ApiState.error(e.message ?? 'Network error');
    }

    notifyListeners();
  }
  void setSortOrder(SortOrder order){
    _sortOrder = order;
    _applySorting();
  }

  void _applySorting(){
    final users = userListState.data;
    if(users == null) return;

    users.sort((a,b) {
      final nameA = '${a.firstName} ${a.lastName}'.toLowerCase();
      final nameB = '${b.firstName} ${b.lastName}'.toLowerCase();

      return _sortOrder == SortOrder.az ? nameA.compareTo(nameB):nameB.compareTo(nameA);

    });

    userListState = ApiState.success(List<UserModel>.from(users));
    notifyListeners();
  }

}

