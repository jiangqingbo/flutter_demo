import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/3 5:51 PM
/// email: jqbo84@163.com
///

void main() => runApp(MaterialApp(home: HomePage(),));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  List<Offset> points = List();

  Animation<double> _doubleAnim;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1))..forward();
    _doubleAnim = Tween(begin: 20.0, end: 200.0).animate(_animationController)
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
    Offset offset = Offset(0, 0);
    points.add(offset);
    return Scaffold(
      body: Center(
        child: Container(
          width: _doubleAnim.value,
          height: _doubleAnim.value,
//          color: Color(0xffff0000),
          child: CustomPaint(
              painter:
                  HeartPainter(points, _doubleAnim.value, _doubleAnim.value)),
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

class HeartPainter extends CustomPainter {
  List<Offset> points;
  double width;
  double height;
  Path heartPath;

  HeartPainter(this.points, this.width, this.height)
      : assert(width > 0),
        assert(height > 0) {
    _initHeartPath();
  }

  Paint _paint = Paint()
    ..color = Color(0xffff0000)
    ..isAntiAlias = true
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    points.forEach((offset) {
      canvas
        ..save()
        ..translate(offset.dx - 15, offset.dy - 14)
        ..drawPath(heartPath, _paint)
        ..restore();
    });
  }

  _initHeartPath() {
    heartPath = new Path()
      ..moveTo(width / 2, height / 4)
      ..cubicTo((width * 6) / 7, height / 9, (width * 13) / 13,
          (height * 2) / 5, width / 2, (height * 7) / 12)
      ..moveTo(width / 2, height / 4)
      ..cubicTo(width / 7, height / 9, width / 21, (height * 2) / 5, width / 2,
          (height * 7) / 12);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
