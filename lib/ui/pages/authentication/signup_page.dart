import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("App SignUp"),
            ElevatedButton(
              onPressed: () {},
              child: Text("Create user"),
            )
          ],
        ),
      ),
    );
  }
}
