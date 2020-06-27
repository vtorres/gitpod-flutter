import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acceso al sistema'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/logo.png'),
            ),
            Padding(
                child: Text(
                  'GSS Paraguay',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.all(15.0)),
            Padding(
              child: Text('Desarrollado por DR2GSistemas'),
              padding: EdgeInsets.all(5.0),
            ),
            Padding(
              child: Text('Version: 2020.1.0'),
              padding: EdgeInsets.all(5.0),
            ),
          ],
        ),
      ),
    );
  }
}
