import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionController extends GetxController {
  final RxInt currentPageIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
  final List<String> imagePaths = [
    'assets/images/intro_img1.jpg',
    'assets/images/intro_img2.jpg',
    'assets/images/intro_img3.jpg',
  ];
  final List<String> textTitles = [
    'Unlimited movies, TV shows, and more.',
    'Watch anywhere, anytime.',
    'Cancel anytime.',
  ];
  final List<String> textSubtitles = [
    'Watch anywhere. Cancel anytime.',
    'Stream on your phone, tablet, laptop, and TV.',
    'No commitments. Cancel online.',
  ];

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void changePage(int index) {
    currentPageIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}