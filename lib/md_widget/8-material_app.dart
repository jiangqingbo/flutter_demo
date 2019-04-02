import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/1 8:13 PM
/// email: jqbo84@163.com
///

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp',
      routes: {'/other': (BuildContext context) => OtherPage()},
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final _widgetOption = [
    Text('信息'),
    Text('通讯录'),
    Text('发现'),
    Text('我'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialApp示例'),
      ),
      body: _widgetOption.elementAt(_currentIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/other');
        },
        tooltip: '路由跳转',
        foregroundColor: Color(0xffffffff),
        backgroundColor: Color(0xff000000),
        //阴影
        elevation: 0.0,
        child: Icon(Icons.arrow_forward),
        //        shape: RoundedRectangleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('信息'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text('通讯录'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.near_me),
            title: Text('发现'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('我'),
          ),
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OtherPage'),
      ),
    );
  }
}
