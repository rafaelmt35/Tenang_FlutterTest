import 'package:flutter/material.dart';
import 'package:tenang_flutter_project/const.dart';
import 'package:tenang_flutter_project/custom_widgets.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(30.0),
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
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: darkgrey,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w700),
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
                    isObscured: false,
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
                  height: 30,
                ),
                GestureDetector(
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
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
    );
  }
}
