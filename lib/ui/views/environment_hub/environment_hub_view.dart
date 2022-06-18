import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/views/radiology_hub/radiology_viewmodel.dart';

import '../../shared_widgets/menu_tile.dart';

class EnvironmentHubView extends StatelessWidget {
  const EnvironmentHubView({Key? key}) : super(key: key);

  // void _showPicker(context, DiabetesViewModel model) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return SafeArea(
  //           child: Wrap(
  //             children: <Widget>[
  //               ListTile(
  //                 leading: const Icon(Icons.photo_camera),
  //                 title: const Text('Camera'),
  //                 onTap: () {
  //                   model.getImageFromCamera();
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //               ListTile(
  //                   leading: const Icon(Icons.photo_library),
  //                   title: const Text('Photo Library'),
  //                   onTap: () {
  //                     model.getImageFromGallery();

  //                     Navigator.of(context).pop();
  //                   }),
  //             ],
  //           ),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RadiologyViewModel>();
    return BaseViewWidget(
      avoidScrollView: false,
      body: Column(
        children: <Widget>[
          const Spacer(),
          const Spacer(),
          // const HeaderWidget(),
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
          vm.loading
              ? const SpinKitWanderingCubes(
                  color: Colors.white,
                  size: 50.0,
                )
              : Menu2Tile(
                  title: 'AQI Levels Searcher',
                  preHead: 'Environment Hub',
                  subTitle: 'Let\'s Find Out',
                  iconPath: AppIcons.aqiLevels,
                  color: const Color(0xFF5EAA46).withOpacity(0.1),
                  iconHeight: 60,
                  action: () {
                    // _showPicker(context, context.read<DiabetesViewModel>());
                  },
                ),
          vm.loading
              ? const SpinKitWanderingCubes(
                  color: Colors.white,
                  size: 50.0,
                )
              : Menu2Tile(
                  preHead: 'Environment Hub',
                  title: 'Air Cognizer',
                  subTitle: 'Let\'s Detect',
                  iconPath: AppIcons.airCognizer,
                  iconHeight: 60,
                  color: const Color(0xFFDFF5FD).withOpacity(0.1),
                  action: () {
                    // _showPicker(context, context.read<DiabetesViewModel>());
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
