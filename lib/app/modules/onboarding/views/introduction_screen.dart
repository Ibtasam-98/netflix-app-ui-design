import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/app/config/app_colors.dart';
import 'package:get/get.dart';
import '../../../controllers/introduction_screen_controller.dart';

class IntroductionScreen extends StatelessWidget {
  final IntroductionController controller = Get.put(IntroductionController());

  IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: screenWidth * 0.3,
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.01),
          child: Image.asset('assets/images/logo.png', height: screenWidth * 0.04),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'PRIVACY',
              style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.03),
            ),
          ),
          SizedBox(width: screenWidth * 0.01),
          TextButton(
            onPressed: () {},
            child: Text(
              'HELP',
              style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.03),
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemCount: controller.imagePaths.length,
            onPageChanged: controller.changePage,
            itemBuilder: (context, index) {
              return  // Removed Positioned
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.25,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            controller.imagePaths[index],
                            fit: BoxFit.cover,
                            width: screenWidth * 0.8,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Text(
                      controller.textTitles[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      controller.textSubtitles[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                  ],
                );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: screenHeight * 0.12,
            child: Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(controller.imagePaths.length, (index) {
                  return GestureDetector(
                    onTap: () => controller.changePage(index),
                    child: Container(
                      width: screenWidth * 0.02,
                      height: screenHeight * 0.01,
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.currentPageIndex.value == index ? Colors.red : Colors.grey,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: screenHeight * 0.03,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: SizedBox(
                width: double.infinity,
                height: screenHeight * 0.06,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE50914),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}