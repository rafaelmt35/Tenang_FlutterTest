import 'package:flutter/material.dart';
import 'package:tenang_flutter_project/const.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            children: const [
              Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                      color: darkgrey),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              Text(
                'Profile picture, name, email, and logout button',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
