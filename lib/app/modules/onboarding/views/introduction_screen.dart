import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/app/config/app_colors.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});
  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;
  final List<String> _imagePaths = [
    'assets/images/intro_img1.jpg',
    'assets/images/intro_img2.jpg',
    'assets/images/intro_img3.jpg',
  ];
  final List<String> _textTitles = [
    'Unlimited movies, TV shows, and more.',
    'Watch anywhere, anytime.',
    'Cancel anytime.',
  ];
  final List<String> _textSubtitles = [
    'Watch anywhere. Cancel anytime.',
    'Stream on your phone, tablet, laptop, and TV.',
    'No commitments. Cancel online.',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
            controller: _pageController,
            itemCount: _imagePaths.length,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
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
                            _imagePaths[index],
                            fit: BoxFit.cover,
                            width: screenWidth * 0.8,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Text(
                      _textTitles[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      _textSubtitles[index],
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_imagePaths.length, (index) {
                return GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    width: screenWidth * 0.02,
                    height: screenHeight * 0.01,
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPageIndex == index ? Colors.red : Colors.grey,
                    ),
                  ),
                );
              }),
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
                    backgroundColor: AppColors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                      color: AppColors.white,
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

