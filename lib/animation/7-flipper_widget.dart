import 'package:flutter/material.dart';
import 'dart:math';

///
/// author: bobo
/// create time: 2019/4/9 6:15 PM
/// email: jqbo84@163.com
///

void main() => runApp(MaterialApp(
  home: FlipperWidgetPage(),
));

class FlipperWidgetPage extends StatefulWidget {
  @override
  _FlipperWidgetPageState createState() => _FlipperWidgetPageState();
}

class _FlipperWidgetPageState extends State<FlipperWidgetPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;
  bool reversed = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: -pi / 2),
        weight: 0.5,
      ),
      TweenSequenceItem(
        tween: Tween(begin: pi / 2, end: 0.0),
        weight: 0.5,
      ),
    ]).animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  _doAnim() {
    reversed ? _animationController.reverse() : _animationController.forward();
    reversed = !reversed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FlipperWidget示例'),),
      body: Center(
        child: AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context, Widget child) {
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                ..rotateX(_animation.value), // X 轴旋转
//                  ..rotateY(_animation.value), // Y轴旋转
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: _doAnim,
                  child: IndexedStack(
                    children: <Widget>[
                      CardOne(),
                      CardTwo(),
                    ],
                    alignment: Alignment.center,
                    index: _animationController.value < 0.5 ? 0 : 1,//0~1
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffff0000),
      child: Container(
        width: 200.0,
        height: 200.0,
        child: Text(
          '点我看密码',
          style: TextStyle(color: Color(0xffffffff), fontSize: 30.0),
        ),
      ),
    );
  }
}

class CardTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff0000ff),
      child: Container(
        width: 200.0,
        height: 200.0,
        child: Text(
          '123456',
          style: TextStyle(color: Color(0xffffffff), fontSize: 30.0),
        ),
      ),
    );
  }
}
