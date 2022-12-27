import 'package:flutter/material.dart';
import 'package:tenang_flutter_project/const.dart';

import '../custom_widgets.dart';

class DoctorListPage extends StatefulWidget {
  const DoctorListPage({Key? key}) : super(key: key);

  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
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
                  'Doctor List with search',
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
              ListAngkaRichText(
                  )
            ],
          ),
        )),
      ),
    );
  }
}
