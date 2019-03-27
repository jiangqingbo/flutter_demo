///
/// author: bobo
/// create time: 2019/3/27 1:43 PM
/// email: jqbo84@163.com
///

import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container示例demo'),
        ),
        body: Center(
          child: Container(
//            color: Colors.green, //container中的color不能和下面的decoration的color同时设置值
            padding: EdgeInsets.all(20.0), //padding: EdgeInsets.only(top: 20.0),
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Color(0xffff0000), width: 5),
              borderRadius: const BorderRadius.all(const Radius.circular(30))
            ),
            child: Text(
              'Container',
              style: TextStyle(fontSize: 40.0),
            ),
            transform: Matrix4.rotationZ(-pi/9),
          ),
        ),
      ),
    );
  }
}

