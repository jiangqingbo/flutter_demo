import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/10 5:18 PM
/// email: jqbo84@163.com
///

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var images = [
    'assets/images/f1.png',
    'assets/images/f1.png',
    'assets/images/f1.png',
    'assets/images/f1.png',
    'assets/images/f1.png',
    'assets/images/f1.png',
    'assets/images/f1.png',
    'assets/images/f1.png',
    'assets/images/f1.png',
    'assets/images/f1.png',
    'assets/images/f1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
//      child: sumListWheelScrollView(), // 数字滚轮效果
      child: imageListWheelScrollView(),  // 图片滚动效果
    ));
  }

  ListWheelScrollView sumListWheelScrollView() {
    return ListWheelScrollView(
      perspective: 0.001,
      diameterRatio: 1.0,
      itemExtent: MediaQuery.of(context).size.height,
      children: List.generate(20, (index) => index)
          .map((m) => Text(
                m.toString(),
                style: TextStyle(fontSize: 30.0),
              ))
          .toList(),
    );
  }

  ListWheelScrollView imageListWheelScrollView() {
    return ListWheelScrollView(
      perspective: 0.003,
      diameterRatio: 2.0,
      itemExtent: MediaQuery.of(context).size.height * 0.6,
      children: images
          .map((m) => Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.asset(
                      m,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 30.0,
                      left: 30.0,
                      child: Text(
                        '天之道',
                        style:
                            TextStyle(color: Color(0xffffffff), fontSize: 30.0),
                      ),
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}
