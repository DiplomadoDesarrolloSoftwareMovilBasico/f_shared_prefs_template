import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/authentication/signup_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication Flow',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: Content(),
      home: SignUpPage(),
    );
  }
}
