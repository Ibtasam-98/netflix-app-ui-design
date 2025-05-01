import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/app/config/app_colors.dart';

import '../modules/onboarding/views/introduction_screen.dart';

class OnBoardingController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() => IntroductionScreen()); // Use Get.off here
    });
  }
}