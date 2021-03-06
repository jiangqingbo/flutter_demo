import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/3 5:16 PM
/// email: jqbo84@163.com
///

void main() => runApp(MaterialApp(
      home: AnimationDoublePage(),
    ));

class AnimationDoublePage extends StatefulWidget {
  @override
  _AnimationDoublePageState createState() => _AnimationDoublePageState();
}

class _AnimationDoublePageState extends State<AnimationDoublePage>
    with SingleTickerProviderStateMixin {
  Animation<double> _doubleAnim;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();
    _doubleAnim = Tween(begin: 20.0, end: 200.0)
        .animate(_animationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _animationController.forward();
            }
          });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimationDouble示例'),),
      body: Center(
        child: Container(
          width: _doubleAnim.value,
          height: _doubleAnim.value,
          color: Color(0xffff0000),
          child: FlutterLogo(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController.forward();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
