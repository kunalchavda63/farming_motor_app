import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/utilities/src/extensions/extensions.dart';
import 'package:farming_motor_app/features/export_screens.dart';
import 'package:farming_motor_app/features/screens/provider/customer_provider/customer_provider.dart';
import 'package:provider/provider.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final provider = context.read<CustomerProvider>();
      final pumps = provider.pumpListState.data ?? [];

      for (final pump in pumps) {
        provider.loadPumpLogs(
          serialNumber: pump.serialNumber!,
          pumpId: pump.pumpID!, // ✅ FIXED
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CustomerProvider>();
    final pumps = provider.pumpListState.data ?? [];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(

        isCenterTitle: false,
        bgColor: AppColors.hex5474.withOAlpha(0.25),
        title: CustomText(
          data: 'Logs',
          style: const TextStyle()
              .s(25)
              .w(400)
              .c(AppColors.hex2e47)
              .family(FontFamily.montserrat),
        ),
      ),
      body: pumps.isEmpty
          ? const Center(child: CustomText(data: 'No pumps found'))
          : ListView.builder(
        itemCount: pumps.length,
        itemBuilder: (context, index) {
          final pump = pumps[index];
          final key = '${pump.serialNumber}-${pump.pumpID}';
          final logState = provider.pumpLogsMap[key];

          return CustomContainer(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            borderRadius: BorderRadius.circular(10),
            color: AppColors.black10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  data: 'Pump: ${pump.serialNumber}',
                  style: BaseStyle.s14w400,
                ),
                const SizedBox(height: 30),

                if (logState == null || logState.loading)
                  const Center(child: CircularProgressIndicator()),

                if (logState?.error != null)
                  CustomText(
                    data: logState!.error!,
                    style: BaseStyle.s14w400.c(Colors.red),
                  ),

                if (logState?.data != null)
                  Column(
                    children: List.generate(logState!.data!.length, (index) {
                      final log = logState.data![index];
                      final isStart = log.action.toString().toLowerCase().contains('start');

                      return CustomContainer(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.white,
                        child: Row(
                          children: [
                            /// 🔢 INDEX
                            CustomText(
                              data: '${index + 1}.',
                              style: BaseStyle.s14w500,
                            ),

                            const SizedBox(width: 10),

                            /// 🟢🔴 STATUS CIRCLE
                            Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isStart ? Colors.green : Colors.red,
                              ),
                            ),

                            const SizedBox(width: 12),

                            /// ACTION TEXT
                            Expanded(
                              child: CustomText(
                                data: isStart ? 'Pump Started' : 'Pump Stopped',
                                style: BaseStyle.s14w500,
                              ),
                            ),

                            /// ⏱ CENTERED TIME
                            CustomText(
                              data: formatTime(log.timestamp as DateTime),
                              style: BaseStyle.s14w400.c(AppColors.black),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),


              ],
            ),
          );
        },
      ),
    );
  }
}
