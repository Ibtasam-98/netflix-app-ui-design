
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/modules/onboarding/views/onboarding_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Device orientations to portrait only.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    const designWidth = 360.0;
    const designHeight = 690.0;

    return ScreenUtilInit(
      designSize: Size(designWidth, designHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: OnBoardingScreen(),
    );
  }
}
