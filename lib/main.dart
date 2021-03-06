// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/root/root.dart';
import 'package:healthcare_360_mobile/ui/views/cancer_hub/cervical_cancer/cervical_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/cancer_hub/lymphoma/lymphoma_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/emr_hub/emr_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/environment_hub/air_cognizer/cognizer_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/malaria_hub/malaria_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/menu/menu_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/radiology_hub/covid_19/cov_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/radiology_hub/pneumonia/pneumona_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/radiology_hub/thorax_diseases/thorax_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/radiology_hub/tuberculosis/tuberculosis_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/retinal_hub/ocular_diseases/ocular_disease_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/retinal_hub/retina_hub_view.dart';
import 'package:healthcare_360_mobile/ui/views/retinal_hub/diabetes/diabetes_viewmodel.dart';
import 'package:healthcare_360_mobile/ui/views/retinal_hub/retinopathy/retinopathy_viewmodel.dart';

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
        ChangeNotifierProvider(create: (_) => CognizerViewModel()),
        ChangeNotifierProvider(create: (_) => CervicalViewModel()),
        ChangeNotifierProvider(create: (_) => LymphomaViewModel()),
        ChangeNotifierProvider(create: (_) => DiabetesViewModel()),
        ChangeNotifierProvider(create: (_) => EmrViewmodel()),
        ChangeNotifierProvider(create: (_) => MalariaViewModel()),
        ChangeNotifierProvider(create: (_) => RetinopathyViewModel()),
        ChangeNotifierProvider(create: (_) => OcularDiseaseViewModel()),
        ChangeNotifierProvider(create: (_) => CovViewModel()),
        ChangeNotifierProvider(create: (_) => PneumoniaViewModel()),
        ChangeNotifierProvider(create: (_) => ThoraxViewModel()),
        ChangeNotifierProvider(create: (_) => TuberculosisViewModel()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () {
          return GetMaterialApp(
            theme: ThemeData(
                fontFamily: 'poppins',
                buttonColor: AppColors.purple,
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.purple)))),
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
