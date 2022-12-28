import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tenang_flutter_project/const.dart';
import 'package:tenang_flutter_project/custom_widgets.dart';
import 'package:tenang_flutter_project/main.dart';
import 'package:tenang_flutter_project/signinservice/signin.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController controllerFullName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  bool checkedValue = false;
  TextEditingController controllerPass = TextEditingController();
  bool visibleAlert = false;
  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPass.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future SignUp() async {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: controllerEmail.text.trim(),
            password: controllerPass.text.trim());
      } on FirebaseAuthException catch (e) {
        print(e);
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: darkgrey,
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'create new account',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                    color: grey),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      TextFieldCustom2(
                          isObscured: false,
                          controller: controllerFullName,
                          inputtype: TextInputType.text,
                          hinttext: 'Full Name'),
                      TextFieldCustom2(
                          isObscured: false,
                          controller: controllerEmail,
                          inputtype: TextInputType.emailAddress,
                          hinttext: 'Email'),
                      TextFieldCustom2(
                          isObscured: true,
                          controller: controllerPass,
                          inputtype: TextInputType.text,
                          hinttext: 'Password'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: checkedValue,
                              activeColor: bluedark,
                              onChanged: (newValue) {
                                setState(() {
                                  checkedValue = newValue!;
                                });
                              }),
                          const SizedBox(
                            width: 250,
                            child: Text(
                              'By creating an account you agree to our Terms of Service and Privacy Policy',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16.0),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Visibility(
                          visible: visibleAlert,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                '* Field not completed',
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: (() {
                          if (!checkedValue ||
                              controllerEmail.text.isEmpty ||
                              controllerFullName.text.isEmpty ||
                              controllerPass.text.isEmpty) {
                            setState(() {
                              visibleAlert = true;
                            });
                          } else {
                            SignUp();
                          }
                        }),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: bluedark),
                          child: const Center(
                            child: Text(
                              'Sign up',
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
                  const SizedBox(
                    height: 240,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const SignInPage())));
                        },
                        child: const Text(
                          'Sign in!',
                          style: TextStyle(
                              color: bluedark,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
