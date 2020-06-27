import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(CupertinoApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gitpod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
