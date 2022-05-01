import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("App Login"),
            ElevatedButton(onPressed: () {}, child: Text("Login")),
            TextButton(onPressed: () {}, child: Text("Create user"))
          ],
        ),
      ),
    );
  }
}
