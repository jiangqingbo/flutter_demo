import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/2 5:34 PM
/// email: jqbo84@163.com
///

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoButton(
          child: Text('CupertinoButton'),
          color: Color(0xff00ff00),
          onPressed: (){},
        ),
      ),
    );
  }
}

