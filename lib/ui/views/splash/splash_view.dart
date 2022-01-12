import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  _waitAndNavigate() async {
    await Future.delayed(const Duration(seconds: 3));
    // Get.offAll(() => const OnboardingView1());
  }

  @override
  void initState() {
    super.initState();
    _waitAndNavigate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF7474BF),
          Color(0xFF348AC7),
        ]),
      ),
      child: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [],
        ),
      ),
    );
  }
}
