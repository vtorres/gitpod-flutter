import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitpodflutter/login.dart';

void main() => runApp(MaterialApp(
      title: 'GSS Paraguay',
      home: LoginScreen(),
      theme: ThemeData(primaryColor: Colors.black),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/images/logo.png'),
        ),
        Text(
          'GSS Paraguay',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Text(
          'Desarrollado por DR2GSistemas',
          style: TextStyle(fontSize: 9.0),
        )
      ],
    )));
  }
}
