import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/views/menu/menu_view.dart';
import 'package:healthcare_360_mobile/ui/views/onboarding/onboarding_view.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  _waitAndNavigate() async {
    await Future.delayed(const Duration(seconds: 4));
    // Get.offAll(() => OnboardingView());
    Get.offAll(() => const MenuView());
  }

  @override
  void initState() {
    super.initState();
    _waitAndNavigate();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      LottieBuilder.asset(
                        AppAnimations.background,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          AppIcons.logo,
                          height: 250,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const SizedBox(
                    height: 15,
                    child: SpinKitThreeInOut(
                      color: AppColors.blue,
                      // size: 30,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
