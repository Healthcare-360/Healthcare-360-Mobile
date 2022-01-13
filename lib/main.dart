import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/root/root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // MultiProvider(
        //   providers: const [],
        //   child:
        ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () {
        return GetMaterialApp(
          theme: ThemeData(fontFamily: 'poppins'),
          debugShowCheckedModeBanner: false,
          home: const Root(),
        );
      },
      //   ),
    );
  }
}
