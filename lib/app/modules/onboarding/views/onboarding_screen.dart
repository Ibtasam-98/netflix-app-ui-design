import '../../../config/app_colors.dart';
import '../../../controllers/onboarding_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {

  final OnBoardingController controller = Get.put(OnBoardingController());

  OnBoardingScreen({super.key}); // Corrected constructor.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Image.asset(
          'assets/anim/netflix.gif',
          width: 200.w,
          height: 200.h,
        ),
      ),
    );
  }
}