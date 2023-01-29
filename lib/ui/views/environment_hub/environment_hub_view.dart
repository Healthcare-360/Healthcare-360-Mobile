import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/views/environment_hub/air_cognizer/cognizer_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/environment_hub/aqi_levels/aqi_levels_searcher_view.dart';
import 'package:material_dialogs/material_dialogs.dart';

import '../../../core/utilities/check_internet.dart';
import '../../shared_widgets/menu_tile.dart';

class EnvironmentHubView extends StatelessWidget {
  const EnvironmentHubView({Key? key}) : super(key: key);

  _showDialog(context) {
    Dialogs.materialDialog(
        // titleAlign: TextAlign.center,
        // msgAlign: TextAlign.center,
        color: Colors.white,
        msg: 'This feature requires internet connection',
        title: 'No Internet Connection',
        lottieBuilder: LottieBuilder.asset(AppAnimations.noInternet),
        context: context,
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.cancel,
                color: AppColors.white,
              ),
              label: const CustomText(
                'Cancel',
                color: AppColors.white,
              ))
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return BaseViewWidget(
      avoidScrollView: false,
      body: Column(
        children: <Widget>[
          const Spacer(),
          const HeaderWidget(),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            'Welcome to Environment Hub',
            textAlign: TextAlign.center,
            color: AppColors.purple,
            style: TextStyles.b_20,
          ),
          CustomText(
            'Detection',
            textAlign: TextAlign.center,
            color: AppColors.grey,
            style: TextStyles.m_16,
          ),
          SizedBox(
            height: 20.h,
          ),
          const CustomText(
            'We use API Calls and Model to find AQI-Levels-Searcher or Air Quality Index through Sky Images. Our intelligent A.I System classifies and categorize the results for you',
            textAlign: TextAlign.center,
            style: TextStyles.r_14,
          ),
          SizedBox(
            height: 30.h,
          ),
          Menu2Tile(
            title: 'AQI Levels Searcher',
            preHead: 'Environment Hub',
            subTitle: 'Let\'s Find Out',
            iconPath: AppIcons.aqiLevels,
            color: const Color(0xFF5EAA46).withOpacity(0.1),
            iconHeight: 60,
            action: () {
              CheckInternet.check().then((status) {
                if (status == InternetStatus.connected) {
                  Get.to(() => const AqiLevelsSearcherView());
                } else if (status == InternetStatus.notConnected) {
                  _showDialog(context);
                }
              });
            },
          ),
          Menu2Tile(
            preHead: 'Environment Hub',
            title: 'Air Cognizer',
            subTitle: 'Let\'s Detect',
            iconPath: AppIcons.airCognizer,
            iconHeight: 60,
            color: const Color(0xFFDFF5FD).withOpacity(0.4),
            action: () {
              context.read<CognizerViewModel>().showPicker(context);
            },
          ),
          const Spacer(),
          const Spacer(),
          const SizedBox(
            height: 36,
          ),
        ],
      ),
    );
  }
}
