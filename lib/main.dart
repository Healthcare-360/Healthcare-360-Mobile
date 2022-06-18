import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/cardio/cardio_vascular_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/root/root.dart';
import 'package:healthcare_360_mobile/ui/views/cancer_hub/cancer_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/cardiac_hub/heart_disease/heart_disease_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/chatbot_hub/chatbot_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/emr_hub/emr_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/environment_hub/environment_hub_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/malaria_hub/malaria_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/menu/menu_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/radiology_hub/radiology_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/retinal_hub/retina_hub_view.dart';
import 'package:healthcare_360_mobile/ui/views/retinal_hub/diabetes/diabetes_viewmodel.dart';

import 'ui/cardio/cardio_vascular_hub.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ); // To turn off landscape mode
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuViewModel()),
        ChangeNotifierProvider(create: (_) => RadiologyViewModel()),
        ChangeNotifierProvider(create: (_) => EnvironmentViewModel()),
        ChangeNotifierProvider(create: (_) => CancerViewModel()),
        ChangeNotifierProvider(create: (_) => DiabetesViewModel()),
        ChangeNotifierProvider(create: (_) => HeartDiseaseViewModel()),
        ChangeNotifierProvider(create: (_) => ChatBotViewModel()),
        ChangeNotifierProvider(create: (_) => EmrViewmodel()),
        ChangeNotifierProvider(create: (_) => MalariaViewModel()),
        ChangeNotifierProvider(create: (_) => CardioVascularViewModel()),
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
                  page: () => const RetinaHubView(),
                  transition: Transition.noTransition),
              GetPage(
                  name: '/cardioHub',
                  page: () => const CardioVascularHub(),
                  transition: Transition.noTransition),
            ],
          );
        },
      ),
    );
  }
}
