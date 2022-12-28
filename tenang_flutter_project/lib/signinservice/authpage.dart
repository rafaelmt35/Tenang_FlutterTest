import 'package:flutter/material.dart';
import 'package:tenang_flutter_project/onboardingscreen/logopage.dart';
import 'package:tenang_flutter_project/signinservice/signin.dart';
import 'package:tenang_flutter_project/signinservice/signup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return isLogin ? const SignInPage() : const LogoPage();
  }

  void toggle() {
    setState(() {
      isLogin = !isLogin;
    });
  }
}
