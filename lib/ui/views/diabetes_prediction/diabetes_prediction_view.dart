import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/shared_widgets/center_tile.dart';
import 'package:healthcare_360_mobile/ui/views/diabetes_prediction/diabetes_viewmodel.dart';

class DiabetesPredictionView extends StatelessWidget {
  const DiabetesPredictionView({Key? key}) : super(key: key);

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
      avoidScrollView: true,
      body: Column(
        children: <Widget>[
          const Spacer(),
          const Spacer(),

          Image.asset(
            'assets/logo.png',
            height: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            'Welcome to Diabetes Hub',
            textAlign: TextAlign.center,
            color: HcColors.blue,
            style: TextStyles.b_20,
          ),
          CustomText(
            'Detection',
            textAlign: TextAlign.center,
            color: HcColors.grey,
            style: TextStyles.m_16,
          ),

          SizedBox(
            height: 20.h,
          ),
          const CustomText(
            'We use Computer Vision to detect the Diabetes, by looking at the image of Retina. Our intelligent A.I System classifies and categorize the results for you',
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
              : LargeCenterTile(
                  title: 'Diabetes',
                  subTitle: 'Let\'s Detect',
                  iconPath: 'assets/icons/mobile-camera.svg',
                  color: Colors.orange.shade100,
                  action: () {
                    _showPicker(context, context.read<DiabetesViewModel>());
                    //
                    // Get.to(() => DiabetesPredictionView());
                  },
                ),

          // vm.loading
          //     ? const SpinKitWanderingCubes(
          //         color: Colors.white,
          //         size: 50.0,
          //       )
          //     : SlideAction(
          //         key: _key,
          //         text: 'Get Started',
          //         outerColor: HcColors.blue,
          //         onSubmit: () {
          //           _showPicker(context, context.read<DiabetesViewModel>());
          //           Future.delayed(
          //             const Duration(seconds: 3),
          //             () => _key.currentState!.reset(),
          //           );
          //         },
          //       ),
          const Spacer(),

          const Spacer(),

          // Center(
          //   child: vm.imageFile == null
          //       ? const Text('No image selected.')
          //       : Container(
          //           constraints: BoxConstraints(
          //               maxHeight: MediaQuery.of(context).size.height / 2),
          //           decoration: BoxDecoration(
          //             border: Border.all(),
          //           ),
          //           child: Image.file(vm.imageFile!),
          //         ),
          // ),
          const SizedBox(
            height: 36,
          ),
          // Text(
          //   // ignore: unnecessary_null_comparison
          //   vm.category != null ? vm.category!.label : '',
          //   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          // ),
          // const SizedBox(
          //   height: 8,
          // ),
          // Text(
          //   // ignore: unnecessary_null_comparison
          //   vm.category != null
          //       ? 'Confidence: ${vm.category?.score.toStringAsFixed(3)}'
          //       : '',
          //   style: const TextStyle(fontSize: 16),
          // ),
        ],
      ),
    );
  }
}
