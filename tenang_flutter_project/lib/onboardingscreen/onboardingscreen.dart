import 'package:flutter/material.dart';
import 'package:tenang_flutter_project/const.dart';
import 'package:tenang_flutter_project/custom_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            body: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == 2;
                });
              },
              children: [
                OnboardingWithAssets(
                  controller: _controller,
                  img: 'assets/med.png',
                  command: 'Welcome Alesha',
                ),
                OnboardingWithAssets(
                  controller: _controller,
                  img: 'assets/med2.png',
                  command: 'Find Best Doctor',
                ),
                OnboardingWithAssetsEnd(
                  controller: _controller,
                  img: 'assets/yoga.png',
                ),
              ],
            ),
          ),
        ));
  }
}
