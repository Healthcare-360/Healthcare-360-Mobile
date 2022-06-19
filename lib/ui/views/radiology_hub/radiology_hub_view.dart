import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/views/radiology_hub/covid_19/cov_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/radiology_hub/pneumonia/pneumona_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/radiology_hub/thorax_diseases/thorax_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/radiology_hub/tuberculosis/tuberculosis_viewmodel.dart';

import '../../shared_widgets/menu_tile.dart';

class RadiologyHubView extends StatelessWidget {
  const RadiologyHubView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseViewWidget(
      avoidScrollView: false,
      body: Column(
        children: <Widget>[
          const Spacer(),
          // const HeaderWidget(),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            'Welcome to Radiology Hub',
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
            'We use our Models to detect Pneumonia, Covid-19, Tuberculosis or Thorax Diseases by analyzing xray images. Our intelligent A.I System classifies and categorize the results for you',
            textAlign: TextAlign.center,
            style: TextStyles.r_14,
          ),
          SizedBox(
            height: 30.h,
          ),
          Menu2Tile(
            title: 'Covid\'19',
            preHead: 'Radiology Hub',
            subTitle: 'Let\'s Detect',
            iconPath: AppIcons.covid,
            color: const Color(0xFF009688).withOpacity(0.1),
            iconHeight: 60,
            action: () {
              context.read<CovViewModel>().showPicker(context);
            },
          ),
          Menu2Tile(
            preHead: 'Radiology Hub',
            title: 'Pneumonia',
            subTitle: 'Let\'s Detect',
            iconPath: AppIcons.pneumonia,
            iconHeight: 60,
            color: const Color(0xFFEF5E3B).withOpacity(0.08),
            action: () {
              context.read<PneumoniaViewModel>().showPicker(context);
            },
          ),
          Menu2Tile(
            preHead: 'Radiology Hub',
            title: 'Tuberculosis',
            subTitle: 'Let\'s Detect',
            iconPath: AppIcons.tuberculosis,
            iconHeight: 70,
            color: const Color(0xFF2764EF).withOpacity(0.08),
            action: () {
              context.read<TuberculosisViewModel>().showPicker(context);
            },
          ),

          Menu2Tile(
            preHead: 'Radiology Hub',
            title: 'Thorax Diseases',
            subTitle: 'Let\'s Detect',
            iconPath: AppIcons.thorax,
            iconHeight: 60,
            color: const Color(0xFF1392C3).withOpacity(0.12),
            action: () {
              context.read<ThoraxViewModel>().showPicker(context);
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
