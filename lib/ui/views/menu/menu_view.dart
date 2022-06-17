import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/shared_widgets/menu_tile.dart';
import 'package:healthcare_360_mobile/ui/views/diabetes_prediction/diabetes_prediction_view.dart';
import 'package:healthcare_360_mobile/ui/views/menu/menu_viewmodel.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuViewModel>(builder: (context, vm, child) {
      return BaseViewWidget(
        avoidScrollView: false,
        body: Column(
          children: [
            Lottie.asset(AppAnimations.homeScreen, height: 280),
            SizedBox(
              height: 25.h,
            ),
            Center(
              child: SizedBox(
                // width: 250.0,
                height: 60,
                child: DefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.purple,
                    fontSize: 30.0,
                    fontFamily: 'Canterbury',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Healthcare 360'),
                      TypewriterAnimatedText('Your Healthcare Needs'),
                      //  at One Place
                      TypewriterAnimatedText('At One Place'),
                      TypewriterAnimatedText('Our Healthcare Hubs'),
                    ],
                    onTap: () {},
                  ),
                ),
              ),
            ),
            Menu2Tile(
              title: 'Diabetes',
              subTitle: 'Detection',
              iconPath: 'assets/diabetes.svg',
              iconHeight: 80,
              action: () {
                Get.to(() => const DiabetesPredictionView());
              },
            ),
            Menu2Tile(
              title: 'EMR',
              subTitle: 'Electronic Medical Records',
              iconPath: 'assets/emr.svg',
              iconHeight: 80,
              iconColor: const Color(0xFF2196F3),
              color: const Color(0xFF2196F3).withOpacity(0.1),
              action: () {
                // Get.to(() => const CardioVascularHub());
              },
            ),
            Menu2Tile(
              title: 'Heart Disease',
              subTitle: 'Detection',
              iconPath: 'assets/ecg-reading.svg',
              iconHeight: 80,
              color: AppColors.lightBlue,
              action: () {
                // Get.to(() => const CardioVascularHub());
              },
            ),
            Menu2Tile(
              title: 'Environment',
              subTitle: 'Air Quality',
              iconPath: 'assets/air-quality.svg',
              iconHeight: 80,
              iconColor: const Color.fromARGB(255, 151, 200, 85),
              color: const Color(0xFFCF9F76).withOpacity(0.12),
              action: () {
                // Get.to(() => const CardioVascularHub());
              },
            ),
            Menu2Tile(
              title: 'Radiology',
              subTitle: 'Xrays/CT-Scans',
              iconPath: 'assets/radiactive.svg',
              iconHeight: 80,
              iconColor: const Color(0xFFFFD06B),
              color: const Color(0xFFFFD06B).withOpacity(0.12),
              action: () {
                // Get.to(() => const CardioVascularHub());
              },
            ),
            // robot.svg
            Menu2Tile(
              title: 'Healthcare Assistance',
              subTitle: 'Chat Bot',
              iconPath: 'assets/robot.svg',
              iconHeight: 80,
              iconColor: const Color(0xFFF92C3D),
              color: const Color(0xFFFE4655).withOpacity(0.12),
              action: () {
                // Get.to(() => const CardioVascularHub());
              },
            ),

            SizedBox(
              height: 25.h,
            ),
          ],
        ),
      );
    });
  }
}
