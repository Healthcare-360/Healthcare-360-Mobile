import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/core/utilities/check_internet.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/shared_widgets/menu_tile.dart';
import 'package:healthcare_360_mobile/ui/views/cancer_hub/cancer_hub_view.dart';
import 'package:healthcare_360_mobile/ui/views/chatbot_hub/chatbot_view.dart';
import 'package:healthcare_360_mobile/ui/views/environment_hub/environment_hub_view.dart';
import 'package:healthcare_360_mobile/ui/views/malaria_hub/malaria_hub_view.dart';
import 'package:healthcare_360_mobile/ui/views/menu/menu_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/radiology_hub/radiology_hub_view.dart';
import 'package:healthcare_360_mobile/ui/views/retinal_hub/retina_hub_view.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:material_dialogs/material_dialogs.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  _showDialog() {
    Dialogs.materialDialog(
        titleAlign: TextAlign.center,
        msgAlign: TextAlign.center,
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
              title: 'Retinal Hub',
              subTitle: 'Detection',
              iconPath: AppIcons.retCenter,
              iconHeight: 90,
              color: const Color(0xFFfbebab).withOpacity(0.4),
              action: () {
                Get.to(() => const RetinaHubView());
              },
            ),
            Menu2Tile(
              title: 'Healthcare Assistance',
              subTitle: 'Chat Bot',
              iconPath: 'assets/robot.svg',
              iconHeight: 50,
              iconColor: const Color(0xFFF92C3D),
              color: const Color(0xFFFE4655).withOpacity(0.12),
              action: () {
                CheckInternet.check().then((status) {
                  if (status == InternetStatus.connected) {
                    Get.to(() => const ChatBotView());
                  } else if (status == InternetStatus.notConnected) {
                    _showDialog();
                  }
                });
              },
            ),

            Menu2Tile(
              title: 'Radiology',
              subTitle: 'Xrays/CT-Scans',
              iconPath: 'assets/radiactive.svg',
              iconHeight: 70,
              iconColor: const Color(0xFFFFD06B),
              color: const Color(0xFFFFD06B).withOpacity(0.12),
              action: () {
                Get.to(() => const RadiologyHubView());
              },
            ),
            // robot.svg
            Menu2Tile(
              title: 'Environment',
              subTitle: 'Air Quality',
              iconPath: 'assets/air-quality.svg',
              iconHeight: 70,
              iconColor: const Color.fromARGB(255, 151, 200, 85),
              color: const Color(0xFFCF9F76).withOpacity(0.12),
              action: () {
                Get.to(() => const EnvironmentHubView());
              },
            ),

            Menu2Tile(
              title: 'Heart Disease',
              subTitle: 'Detection',
              iconPath: 'assets/ecg-reading.svg',
              iconHeight: 70,
              color: AppColors.lightBlue,
              action: () {
                CheckInternet.check().then((status) {
                  if (status == InternetStatus.connected) {
                    Get.to(() => const ChatBotView());
                  } else if (status == InternetStatus.notConnected) {
                    _showDialog();
                  }
                });
              },
            ),
            Menu2Tile(
              title: 'Cancer',
              subTitle: 'Detection',
              iconPath: AppIcons.cancer,
              iconHeight: 70,
              color: const Color(0xFFe45363).withOpacity(0.1),
              action: () {
                Get.to(() => const CancerHubView());
              },
            ),

            // Menu2Tile(
            //   title: 'EMR',
            //   subTitle: 'Electronic Medical Records',
            //   iconPath: 'assets/emr.svg',
            //   iconHeight: 60,
            //   iconColor: const Color(0xFF2196F3),
            //   color: const Color(0xFF2196F3).withOpacity(0.1),
            //   action: () {
            //     // Get.to(() => const CardioVascularHub());
            //   },
            // ),
            Menu2Tile(
              title: 'Malaria',
              subTitle: 'Detection',
              iconPath: AppIcons.malaria,
              iconHeight: 70,
              color: const Color(0xFFCE2A55).withOpacity(0.1),
              action: () {
                Get.to(() => const MalariaHubView());
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
