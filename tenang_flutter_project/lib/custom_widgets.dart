import 'package:flutter/material.dart';

import 'const.dart';

class LogoOnboarding extends StatelessWidget {
  const LogoOnboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0, -1),
              end: Alignment(
                0.0,
                0.0,
              ),
              colors: [bluedark, Color(0xff3462FF)])),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}

class OnboardingWithAssets extends StatelessWidget {
  const OnboardingWithAssets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0))),
          )
        ],
      ),
    );
  }
}

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom(
      {Key? key,
      required this.isObscured,
      required this.controller,
      required this.inputtype,
      required this.hinttext,
      required this.icon})
      : super(key: key);
  final IconData icon;
  final bool isObscured;
  final TextEditingController controller;
  final TextInputType inputtype;
  final String hinttext;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      height: 50.0,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
          color: Color(0xFFF4F5F7), borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Icon(
            icon,
            color: bluedark,
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
            height: 50.0,
            width: MediaQuery.of(context).size.width - 112,
            child: TextField(
              obscureText: isObscured,
              controller: controller,
              keyboardType: inputtype,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hinttext,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldCustom2 extends StatelessWidget {
  const TextFieldCustom2({
    Key? key,
    required this.isObscured,
    required this.controller,
    required this.inputtype,
    required this.hinttext,
  }) : super(key: key);

  final bool isObscured;
  final TextEditingController controller;
  final TextInputType inputtype;
  final String hinttext;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      height: 50.0,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
          color: Color(0xFFF4F5F7), borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        height: 50.0,
        width: MediaQuery.of(context).size.width - 112,
        child: TextField(
          obscureText: isObscured,
          controller: controller,
          keyboardType: inputtype,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hinttext,
          ),
        ),
      ),
    );
  }
}
