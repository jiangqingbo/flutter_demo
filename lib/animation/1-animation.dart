import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/3 4:37 PM
/// email: jqbo84@163.com
///

void main() => runApp(MaterialApp(
      home: AnimationPage(),
    ));

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _doubleAnim;
  AnimationController _animationController;
  String _animationValue;

  /// 四种状态
  //1 dismissed 初始状态
  //2 forward 从头到尾播放状态
  //3 reverse 从尾到头播放状态
  //4 completed 完成状态

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _doubleAnim = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        print(_doubleAnim.value.toString());
        setState(() {
          _animationValue = _doubleAnim.value.toString();
        });
      })
      ..addStatusListener((status) {
        print('$status');
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
      appBar: AppBar(title: Text('Animation示例'),),
      body: Center(
        child: Text(_animationValue ??= '0.0'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController.forward(from: 0.0);
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
