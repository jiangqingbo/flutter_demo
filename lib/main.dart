import 'package:flutter/material.dart';
import 'package:flutterdemo/home/base_widget_list_page.dart';
import 'package:flutterdemo/home/contacts_page.dart';
import 'package:flutterdemo/home/discovery_page.dart';
import 'package:flutterdemo/home/other_page.dart';
import 'package:flutterdemo/home/profile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {'/other': (BuildContext context) => OtherPage()},
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final _widgetOption = [
    Text('Widget'),
    Text('通讯录'),
    Text('发现'),
    Text('我'),
  ];

  List<Widget> _pages;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pages = [
      BasicWidgetPage(),
      ContactsPage(),
      DiscoveryPage(),
      ProfilePage(),
    ];

    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widget示例'),
        leading: Icon(Icons.star),
        elevation: 10.0,
        actions: <Widget>[
          Icon(Icons.search),
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.more_vert,
            size: 30.0,
          ),
        ],
      ),
      body: PageView.builder(
//        physics: NeverScrollableScrollPhysics(),//禁止滑动
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
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
        //        shape: RoundedRectangleBorder(), //默认是原型，可以通过shape 改变形状，例如：RoundedRectangleBorder() 是方形
      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, //默认在右下角
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('Widget'),
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
          _pageController.animateToPage(index, duration: Duration(microseconds: 1), curve: Curves.ease);
        },
      ),
      drawer: _buildDrawer(),
    );
  }
}

//侧滑效果
Drawer _buildDrawer() {
  return Drawer(
    elevation: 10.0,
    child: ListView(
      padding: const EdgeInsets.all(0.0),
      children: <Widget>[
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/images/ic_launcher.png'),
          ),
          accountName: Text('jiangqingbo'),
          accountEmail: Text('jiangqingbo@qq.com'),
          otherAccountsPictures: <Widget>[
            Icon(Icons.camera_alt),
          ],
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/f1.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.payment, color: Color(0xff0000ff),),
          title: Text('会员特权'),
        ),
        ListTile(
          leading: Icon(Icons.person_pin, color: Color(0xff4444ff),),
          title: Text('个人信息'),
        ),
        ListTile(
          leading: Icon(Icons.system_update_alt, color: Color(0xff6666ff),),
          title: Text('版本升级'),
        ),
        AboutListTile(
          icon: Icon(Icons.error, color: Color(0xff9999ff),),
          child: Text('关于'),
          applicationName: 'Flutter开发',
          applicationVersion: '1.0',
        ),
      ],
    ),
  );
}
