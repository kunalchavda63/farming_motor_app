import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:intl/intl.dart';

class PumpListingScreen extends StatelessWidget {
  const PumpListingScreen({super.key, this.pumps});

  final List<PumpDetailModel>? pumps;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [

            CustomContainer(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              color: AppColors.white,
              child: Row(
                children: [
                  const CustomImageView(
                    path: AssetImages.imgOfficeLogo,
                    height: 60,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        data: 'Customer Pump List',
                        style: BaseStyle.s14w400.s(18).w(600)
                            .c(AppColors.black)
                            .family(FontFamily.montserrat),
                      ),
                      CustomText(
                        data: 'All installed pumps overview',
                        style: BaseStyle.s11w700.c(AppColors.black.withOAlpha(0.5)),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            LayoutBuilder(
              builder: (context, constraints) {
                final count = _gridCount(constraints.maxWidth);

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: pumps?.length ?? 0,
                  padding: const EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: count,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.85, // ✅ balanced
                  ),
                  itemBuilder: (context, index) {
                    final pump = pumps![index];

                    return CustomContainer(
                      borderRadius: BorderRadius.circular(24),
                      padding: const EdgeInsets.all(20),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.white,
                          AppColors.white50,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOAlpha(0.08),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        )
                      ],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _cardHeader(pump),
                          const Divider(height: 24),

                          _infoRow('Serial No', pump.serialNumber),
                          _infoRow('Pump Name', pump.pumpName),
                          _infoRow('Pump ID', pump.pumpID),
                          _infoRow('Capacity', pump.capacityUnit),
                          _infoRow('Head Unit', pump.headUnit),
                          _infoRow('Location', pump.location),

                          const SizedBox(height: 12),

                          _infoRow(
                            'Installed',
                            _formatDate(pump.installationDate.toString()),
                          ),
                          _infoRow(
                            'Created',
                            _formatDate(pump.createdAt.toString()),
                          ),
                          _infoRow(
                            'Updated',
                            _formatDate(pump.updatedAt.toString()),
                          ),
                        ],
                      ),
                    );

                  },
                );
              },
            ),

          ],
        ),
      ),
    );
  }
  Widget _cardHeader(PumpDetailModel pump) {
    final isActive = pump.isActive == true;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          data: pump.pumpName ?? 'Pump',
          style: BaseStyle.s15w700
              .c(AppColors.black)
              .family(FontFamily.montserrat),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: isActive
                ? Colors.green.withOAlpha(0.15)
                : Colors.red.withOAlpha(0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: CustomText(
            data: isActive ? 'ACTIVE' : 'INACTIVE',
            style: BaseStyle.s11w700.c(
              isActive ? Colors.green : Colors.red,
            ),
          ),
        ),
      ],
    );
  }
  String _formatDate(String? date) {
    if (date == null || date.isEmpty) return '-';

    final dt = DateTime.tryParse(date);
    if (dt == null) return date;

    return DateFormat('dd MMM yyyy, hh:mm a').format(dt);
  }

  Widget _infoRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: CustomText(
              data: '$title :',
              style: BaseStyle.s14w400
                  .c(AppColors.hex5474)
                  .family(FontFamily.montserrat),
            ),
          ),
          Expanded(
            flex: 6,
            child: CustomText(
              data: value ?? '-',
              style: BaseStyle.s14w400.c(AppColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
  int _gridCount(double width) {
  if (width >= 1200) return 4;
  if (width >= 900) return 3;
  if (width >= 600) return 2;
  return 1;
}


String formatTime(DateTime datetime) {
  return DateFormat('hh:mm:ss').format(datetime);
}
