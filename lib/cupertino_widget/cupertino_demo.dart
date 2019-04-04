import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/3 1:26 PM
/// email: jqbo84@163.com
///

main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    var physicalSize = window.physicalSize;
    print('width: ${size.width}, height: ${size.height}, devicePixelRatio: $devicePixelRatio');
    print('width: ${physicalSize.width}, height: ${physicalSize.height}, devicePixelRatio: ${window.devicePixelRatio}');

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('主页'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          title: Text('消息'),
        ),
      ]),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return MyHome();
                break;
              case 1:
                return MyMessage();
                break;
            }
          },
        );
      },
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('主页'),
        leading: Icon(CupertinoIcons.back),
        trailing: Icon(CupertinoIcons.search),
      ),
      child: Center(
        child: Text(
          '主页。。。',
          maxLines: 1,
          style: TextStyle(
              fontSize: 20.0,
              color: Color(0xff00ff00),
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}

class MyMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('消息'),
        leading: Icon(CupertinoIcons.back),
        trailing: Icon(CupertinoIcons.search),
      ),
      child: Center(
        child: Text(
          '消息。。。',
          style: TextStyle(
            color: Color(0xFFFF0000),
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
