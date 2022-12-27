import 'package:flutter/material.dart';
import 'package:tenang_flutter_project/custom_widgets.dart';
import 'package:tenang_flutter_project/onboardingscreen/onboardingscreen.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({Key? key}) : super(key: key);

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => OnBoardingScreen())));
          },
          child: SafeArea(
            child: Scaffold(body: LogoOnboarding()),
          ),
        ));
  }
}
