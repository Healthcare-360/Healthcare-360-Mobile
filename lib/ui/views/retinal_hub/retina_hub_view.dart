import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/views/retinal_hub/ocular_diseases/ocular_disease_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/retinal_hub/retinopathy/retinopathy_viewmodel.dart';

import '../../shared_widgets/menu_tile.dart';
import 'diabetes/diabetes_viewmodel.dart';

class RetinaHubView extends StatelessWidget {
  const RetinaHubView({Key? key}) : super(key: key);

  void _showPicker(context, DiabetesViewModel model) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    model.getImageFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      model.getImageFromGallery();

                      Navigator.of(context).pop();
                    }),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<DiabetesViewModel>();
    return BaseViewWidget(
      avoidScrollView: false,
      body: Column(
        children: <Widget>[
          const Spacer(),

          const Spacer(),
          // const HeaderWidget(),
          const SizedBox(
            height: 100,
          ),
          const CustomText(
            'Welcome to Retinal Hub',
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
            'We use our Models to detect Diabetes, Diabetic Retinopathy or Ocular Diseases by looking at the image of Retina. Our intelligent A.I System classifies and categorize the results for you',
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
                  title: 'Diabetes',
                  preHead: 'Retinal Hub',
                  subTitle: 'Let\'s Detect',
                  iconPath: 'assets/diabetes.svg',
                  color: Colors.red.withOpacity(0.1),
                  iconHeight: 60,
                  action: () {
                    _showPicker(context, context.read<DiabetesViewModel>());
                    //
                    // Get.to(() => DiabetesPredictionView());
                  },
                ),
          Menu2Tile(
            preHead: 'Retinal Hub',
            title: 'Diabetic Retinopathy',
            subTitle: 'Let\'s Detect',
            iconPath: AppIcons.retinoPathy,
            iconHeight: 70,
            color: const Color(0xFF0B9B97).withOpacity(0.08),
            action: () {
              context.read<RetinopathyViewModel>().showPicker(context);
            },
          ),
          Menu2Tile(
            preHead: 'Retinal Hub',
            title: 'Ocular Diseases',
            subTitle: 'Let\'s Detect',
            iconPath: AppIcons.ocular,
            iconHeight: 60,
            color: const Color(0xFF5A87F2).withOpacity(0.12),
            action: () {
              context.read<OcularDiseaseViewModel>().showPicker(context);
            },
          ),
          const Spacer(),
          const SizedBox(
            height: 36,
          ),
        ],
      ),
    );
  }
}
