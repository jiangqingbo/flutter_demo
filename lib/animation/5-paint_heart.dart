import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/9 5:50 PM
/// email: jqbo84@163.com
///

void main() => runApp(MaterialApp(
      home: PaintHeartPage(),
    ));

class PaintHeartPage extends StatefulWidget {
  @override
  _PaintHeartPageState createState() => _PaintHeartPageState();
}

class _PaintHeartPageState extends State<PaintHeartPage> {
  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    final Size logicalSize = MediaQuery.of(context).size;
    final double _width = logicalSize.width;
    final double _height = logicalSize.height;

    return Scaffold(
      appBar: AppBar(title: Text('点击画出心形图示例'),),
      body: Container(
        width: _width,
        height: _height,
        child: GestureDetector(
          onTapUp: (TapUpDetails details) {
            print('opTapUp');
            setState(() {
              RenderBox renderBox = context.findRenderObject();
              Offset _localPosition =
                  renderBox.globalToLocal(details.globalPosition);
              _points = List.from(_points)..add(_localPosition);
            });
          },
          child: CustomPaint(
            painter: HeartPainter(points: _points),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.clear),
          onPressed: () {
            _points.clear();
          }),
    );
  }
}

class HeartPainter extends CustomPainter {
  final List<Offset> points;
  final double width;
  final double height;

  HeartPainter({this.width = 20, this.height = 20, this.points}):assert(points != null);

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()
      ..color = Color(0xffff0000)
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length; i++) {
      if (points[i] != null) {
        Path path = Path();
        path.moveTo(points[i].dx, points[i].dy - height / 6);
        path.cubicTo(
            points[i].dx + width * 5 / 14,
            points[i].dy - height * 7 / 18,
            points[i].dx + width / 2,
            points[i].dy - height / 10,
            points[i].dx,
            points[i].dy + width / 2);
        canvas.drawPath(path, _paint);
        Path path2 = new Path();
        path2.moveTo(points[i].dx, points[i].dy - height / 6);
        path2.cubicTo(
            points[i].dx - width * 5 / 14,
            points[i].dy - height * 7 / 18,
            points[i].dx - width / 2,
            points[i].dy - height / 10,
            points[i].dx,
            points[i].dy + width / 2);
        canvas.drawPath(path2, _paint);
      }
    }
  }

  @override
  bool shouldRepaint(HeartPainter oldDelegate) {
    return oldDelegate.points != points;
  }

}
