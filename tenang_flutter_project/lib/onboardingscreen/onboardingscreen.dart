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
                  isLastPage = index == 3;
                });
              },
              children: const [
                LogoOnboarding(),
                OnboardingWithAssets(),
                OnboardingWithAssets(),
                OnboardingWithAssets(),
              ],
            ),
            bottomSheet: isLastPage
                ? TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      primary: Colors.white,
                      minimumSize: const Size.fromHeight(80.0),
                    ),
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showHome', false);
                    },
                    child: Text(
                      'Ayo Mulai',
                      style: TextStyle(fontSize: 20),
                    ))
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: 80.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              _controller.jumpToPage(2);
                            },
                            child: const Text(
                              'LEWATI',
                              style: TextStyle(color: Colors.white),
                            )),
                        Center(
                            child: SmoothPageIndicator(
                          controller: _controller,
                          count: 3,
                          effect: WormEffect(
                            dotColor: Colors.white,
                            dotWidth: 10.0,
                            dotHeight: 10.0,
                          ),
                          onDotClicked: (index) => _controller.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn),
                        )),
                        TextButton(
                            onPressed: () {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            child: const Text(
                              'LANJUT',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  ),
          ),
        ));
  }
}
