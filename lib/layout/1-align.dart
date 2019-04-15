import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/2 5:04 PM
/// email: jqbo84@163.com
///

void main() => runApp(AlignPage());

class AlignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Align示例'),
      ),
      body: Center(
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Color(0xffff0000),
          ),
        ),
      ),
    );
  }
}
