import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/9 6:05 PM
/// email: jqbo84@163.com
///

void main() => runApp(MaterialApp(
      home: Animation3DPage(),
    ));

class Animation3DPage extends StatefulWidget {
  @override
  _Animation3DPageState createState() => _Animation3DPageState();
}

class _Animation3DPageState extends State<Animation3DPage> {

  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation 3D 示例'),),
      body: Center(
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(_offset.dy * 0.01)
            ..rotateY(_offset.dx * 0.01),
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                _offset += details.delta; //更新offset（point）
              });
            },
            onDoubleTap: () {
              setState(() {
                _offset = Offset.zero;
              });
            },
            child: Container(
              width: 200.0,
              height: 200.0,
              color: Color(0xffff0000),
            ),
          ),
        ),
      ),
    );
  }
}
