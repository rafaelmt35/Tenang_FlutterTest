import 'package:flutter/material.dart';
import 'package:tenang_flutter_project/const.dart';
import 'package:tenang_flutter_project/custom_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            body: Container(
          padding: const EdgeInsets.all(25.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
            child: Text(
              'Home Page',
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                  color: darkgrey),
            ),
              ),
              const SizedBox(
            height: 60.0,
              ),
              const Text(
            'User Stories:',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
            height: 10.0,
              ),
              ListAngka(const [
            'As a user, I want to search doctor by name so that I can find specific doctor easily.',
            'As a user, I want to know top three doctors so that I can easily know who’s the best doctor.',
            'As a user, I want to see my active appointment so I can see it easily.',
            'As a user, I want to see categories available in the app so I can access specific category from home page.',
            'As a user, I want to see bottom navigation with four key menus so I can easily jump to one and another. '
              ])
            ],
          ),
        )),
      ),
    );
  }
}
