import 'dart:math';

import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/2 5:12 PM
/// email: jqbo84@163.com
///

void main() => runApp(MaterialApp(
      home: StackPage(),
    ));

class StackPage extends StatefulWidget {
  @override
  _StackPageState createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack示例'),
      ),
      body: Center(
        //        child: buildPositionedStack(),
//        child: buildAlignmentStack(),
        child: buildIndexedStack(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          _index = Random().nextInt(2) % 2;
        });
      }),
    );
  }

  Stack buildIndexedStack() {
    return IndexedStack(
      index: _index,
      alignment: Alignment(1.2, -1.2),
      children: <Widget>[
        Container(
          color: Color(0xff0000ff),
          width: 200.0,
          height: 200.0,
        ),
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Color(0xffff0000),
        ),
      ],
    );
  }

  Stack buildAlignmentStack() {
    return Stack(
      alignment: Alignment(1.2, -1.2),
      children: <Widget>[
        Container(
          color: Color(0xff0000ff),
          width: 200.0,
          height: 200.0,
        ),
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Color(0xffff0000),
        ),
      ],
    );
  }

  Stack buildPositionedStack() {
    return Stack(
      children: <Widget>[
        Container(
          color: Color(0xffff0000),
          width: 200.0,
          height: 200.0,
        ),
        Positioned(
//              top: 10.0,
          child: CircleAvatar(
            radius: 20.0,
            backgroundColor: Color(0xff0000ff),
          ),
        ),
      ],
    );
  }
}
