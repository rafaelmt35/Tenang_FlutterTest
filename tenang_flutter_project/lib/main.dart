import 'package:flutter/material.dart';
import 'package:tenang_flutter_project/onboardingscreen/logopage.dart';
import 'package:tenang_flutter_project/onboardingscreen/onboardingscreen.dart';
import 'package:tenang_flutter_project/screens/doctorlist.dart';
import 'package:tenang_flutter_project/screens/homepage.dart';
import 'package:tenang_flutter_project/screens/profile.dart';

import 'package:tenang_flutter_project/signinservice/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LogoPage(),
    );
  }
}
