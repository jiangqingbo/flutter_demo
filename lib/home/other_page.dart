import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/12 2:50 PM
/// email: jqbo84@163.com
///

class OtherPage extends StatefulWidget {
  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OtherPage'),
      ),
      body: Container(
        color: Color(0xffcccccc),
        child: Center(
          child: Text('Other Page'),
        ),
      ),
    );
  }
}
