import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/3 5:33 PM
/// email: jqbo84@163.com
///

void main()=>runApp(MaterialApp(
  home: AnimationWidgetPage(),
));

class AnimationWidgetPage extends StatefulWidget {
  @override
  _AnimationWidgetPageState createState() => _AnimationWidgetPageState();
}

class _AnimationWidgetPageState extends State<AnimationWidgetPage> with SingleTickerProviderStateMixin {

  Animation<double> _doubleAnim;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
    AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..forward();
    _doubleAnim = Tween(begin: 0.0, end: 1.0).animate(_animationController)
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
      appBar: AppBar(title: Text('AnimationWidget示例'),),
      body: Center(
        child: MyLogo(
          animation: _doubleAnim,
        ),
      ),
    );
  }
}

class MyLogo extends AnimatedWidget {
  final Tween<double> _rotateAnim = Tween<double>(begin: 0.0, end: 20.0);
  final Tween<double> _scaleAnim = Tween<double>(begin: 1.0, end: 10.0);
//  final Tween<Color> _colorAnim = Tween<Color>(begin: Colors.white, end: Colors.red);

  MyLogo({Key key, @required Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Transform.scale(
      scale: _scaleAnim.evaluate(animation),
      child: Transform.rotate(
        angle: _rotateAnim.evaluate(animation),
        child: Container(
          child: FlutterLogo(),
        ),
      ),
    );
  }
}