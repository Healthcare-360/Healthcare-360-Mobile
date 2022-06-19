import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/views/malaria_hub/malaria_viewmodel.dart';

import '../../shared_widgets/menu_tile.dart';

class MalariaHubView extends StatelessWidget {
  const MalariaHubView({Key? key}) : super(key: key);

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
            'Welcome to Malaria Hub',
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
            'We use our trained Model to detect Malaria through Cell Images. Our intelligent A.I System classifies and categorize the results for you',
            textAlign: TextAlign.center,
            style: TextStyles.r_14,
          ),
          SizedBox(
            height: 30.h,
          ),
          Menu2Tile(
            title: 'Malaria Detection',
            preHead: 'Malaria Hub',
            subTitle: 'Let\'s Find Out',
            iconPath: AppIcons.malaria,
            color: const Color(0xFFe45363).withOpacity(0.1),
            iconHeight: 60,
            action: () {
              context.read<MalariaViewModel>().showPicker(context);
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
