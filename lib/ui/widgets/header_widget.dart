import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppIcons.logo,
      height: 200,
    );
  }
}
