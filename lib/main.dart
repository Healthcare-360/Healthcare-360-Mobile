import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/root/root.dart';
import 'package:healthcare_360_mobile/ui/views/diabetes_prediction/diabetes_prediction_view.dart';
import 'package:healthcare_360_mobile/ui/views/diabetes_prediction/diabetes_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/menu/menu_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuViewModel()),
        ChangeNotifierProvider(create: (_) => DiabetesViewModel()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () {
          return GetMaterialApp(
            theme: ThemeData(fontFamily: 'poppins'),
            initialRoute: '/',
            debugShowCheckedModeBanner: false,
            getPages: [
              GetPage(
                  name: '/',
                  page: () => const Root(),
                  transition: Transition.noTransition),
              GetPage(
                  name: '/diabetesPredictionView',
                  page: () => const DiabetesPredictionView(),
                  transition: Transition.noTransition),
            ],
          );
        },
      ),
    );
  }
}
