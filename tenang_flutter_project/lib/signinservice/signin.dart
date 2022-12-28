import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tenang_flutter_project/const.dart';
import 'package:tenang_flutter_project/custom_widgets.dart';
import 'package:tenang_flutter_project/main.dart';
import 'package:tenang_flutter_project/screens/homepage.dart';
import 'package:tenang_flutter_project/signinservice/signup.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController controllerEmail = TextEditingController();
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
    Future SignInEmailPass() async {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ));

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Center(child: Image.asset('assets/logoblue.png')),
                const SizedBox(
                  height: 25.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome Back',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'sign in to continue',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFieldCustom(
                    icon: Icons.mail,
                    isObscured: false,
                    controller: controllerEmail,
                    inputtype: TextInputType.emailAddress,
                    hinttext: 'Email Address'),
                TextFieldCustom(
                    icon: Icons.lock,
                    isObscured: true,
                    controller: controllerPass,
                    inputtype: TextInputType.text,
                    hinttext: 'Password'),
                const SizedBox(
                  height: 15.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: bluedark,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
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
                  height: 15.0,
                ),
                GestureDetector(
                  onTap: () async {
                    if (controllerEmail.text.isEmpty ||
                        controllerPass.text.isEmpty) {
                      setState(() {
                        visibleAlert = true;
                      });
                    } else {
                      SignInEmailPass();
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: bluedark),
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    '/',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: grey, width: 2.0)),
                    child: Center(
                      child: Image.asset('assets/google.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Do not have account? ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const SignUpPage())));
                      },
                      child: const Text(
                        'Sign up!',
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
      )),
    );
  }
}
