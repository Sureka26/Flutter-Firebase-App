import 'package:flutter/material.dart';
import 'package:flutter_auth_app/src/onboarding/onboard1.dart';
import 'package:flutter_auth_app/src/onboarding/onboard2.dart';
import 'package:flutter_auth_app/src/onboarding/onboard3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: const [
              OnBoardPage1(),
              OnBoardPage2(),
              OnBoardPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.8),
            child: SmoothPageIndicator(
              effect: WormEffect(
                activeDotColor: const Color(0xff2F4093),
                dotColor: Colors.grey.shade400.withOpacity(0.8),
                dotWidth: 8.0,
                dotHeight: 8.0,
              ),
              controller: _pageController,
              count: 3,
            ),
          )
        ],
      ),
    );
  }
}
