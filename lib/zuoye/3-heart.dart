import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/3 4:31 PM
/// email: jqbo84@163.com
///

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "my_zuoye",
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  List<Offset> list = List();

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    debugPrint("--mq=" + mq.toString());
    return Scaffold(
      //如果设置 appbar,手势details坐标有向下误差；参考其他同学的renderBox.globalToLocal也不起作用
//      appBar: AppBar(
//        title: Text("hello"),
//      ),
      body: Container(
        width: mq.size.width,
        height: mq.size.height,
        child: GestureDetector(
          onTap: () {
            debugPrint("--onTap");
          },
          onTapUp: (TapUpDetails details) {
            debugPrint("--onTapUp");
            setState(() {
//              RenderBox renderBox = context.findRenderObject();
//              Offset realOffset =renderBox.globalToLocal(details.globalPosition);
              Offset realOffset = details.globalPosition;
              list.add(realOffset); //保存点击点位置
            });
          },
          child: CustomPaint(
            painter: RedHeartPainter(list),
          ),
        ),
      ),
    );
  }
}

class RedHeartPainter extends CustomPainter {
  List<Offset> list;

  RedHeartPainter(this.list);

  Paint _paint = Paint()
    ..isAntiAlias = true
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5;

  @override
  void paint(Canvas canvas, Size size) {
    debugPrint("--paint");
    list.forEach((f) {
      canvas.save();
      canvas.translate(f.dx - widthRedHeart / 2, f.dy - heightRedHeart / 2);
      drawRedHeart(canvas);
      canvas.restore();
    });
  }

  var widthRedHeart = 40;
  var heightRedHeart = 60;

  //绘制 红心代码，参看的https://blog.csdn.net/u011272795/article/details/83828732
  void drawRedHeart(Canvas canvas) {
    Path mPath = Path();
    mPath.moveTo(widthRedHeart / 2, heightRedHeart / 4);
    mPath.cubicTo(
        (widthRedHeart * 6) / 7,
        heightRedHeart / 9,
        (widthRedHeart * 13) / 13,
        (heightRedHeart * 2) / 5,
        widthRedHeart / 2,
        (heightRedHeart * 7) / 12);
    canvas.drawPath(mPath, _paint);
    Path mPath1 = new Path();
    mPath1.moveTo(widthRedHeart / 2, heightRedHeart / 4);
    mPath1.cubicTo(widthRedHeart / 7, heightRedHeart / 9, widthRedHeart / 21,
        (heightRedHeart * 2) / 5, widthRedHeart / 2, (heightRedHeart * 7) / 12);
    canvas.drawPath(mPath1, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
