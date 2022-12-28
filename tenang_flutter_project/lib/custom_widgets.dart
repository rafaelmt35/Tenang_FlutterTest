import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tenang_flutter_project/signinservice/signin.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:email_validator/email_validator.dart';
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
  const OnboardingWithAssets(
      {Key? key,
      required this.controller,
      required this.img,
      required this.command})
      : super(key: key);
  final PageController controller;
  final String img;
  final String command;
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
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0))),
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  command,
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Preference site about Lorem Ipsum,giving information origins as well as random',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2 - 21.1,
            child: Row(
              children: [
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(img))),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 45.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const WormEffect(
                        dotColor: Colors.white,
                        activeDotColor: Color(0xff7F9DFE),
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                      ),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OnboardingWithAssetsEnd extends StatelessWidget {
  const OnboardingWithAssetsEnd(
      {Key? key, required this.controller, required this.img})
      : super(key: key);
  final PageController controller;
  final String img;
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
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0))),
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Get Fitness Trips',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Preference site about Lorem Ipsum,giving information origins as well as random',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => SignInPage())));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: bluedark),
                    child: const Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2 - 21.1,
            child: Row(
              children: [
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(img))),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 45.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const WormEffect(
                        dotColor: Colors.white,
                        activeDotColor: Color(0xff7F9DFE),
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                      ),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                ),
              ],
            ),
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
          color: const Color(0xFFF4F5F7),
          borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        height: 50.0,
        width: MediaQuery.of(context).size.width - 110,
        child: TextField(
          obscureText: isObscured,
          controller: controller,
          keyboardType: inputtype,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: bluedark,
            ),
            border: InputBorder.none,
            hintText: hinttext,
          ),
        ),
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
          color: const Color(0xFFF4F5F7),
          borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        height: 50.0,
        width: MediaQuery.of(context).size.width - 112,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
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

class ListAngka extends StatelessWidget {
  final List<String> strings;
  ListAngka(this.strings);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(16, 10, 14, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: strings.map((str) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                '\u2022',
                style: TextStyle(
                  fontSize: 17,
                  height: 1.55,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  str,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class ListAngkaRichText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.fromLTRB(16, 10, 14, 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              '\u2022',
              style: TextStyle(
                fontSize: 17,
                height: 1.55,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: RichText(
              text: TextSpan(
                text:
                    'As a user, I want to search doctor by name so that I can find specific doctor easily. (use this api to get the list: ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: 'https://jsonplaceholder.typicode.com/users',
                      style: TextStyle(color: bluedark),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => launch(
                            'https://jsonplaceholder.typicode.com/users')),
                  TextSpan(
                    text: ')',
                  ),
                ],
              ),
            ))
          ]),
        ]));
  }
}
