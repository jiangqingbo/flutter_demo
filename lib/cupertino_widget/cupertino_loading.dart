import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/2 5:48 PM
/// email: jqbo84@163.com
///

void main() => runApp(CupertinoLoadingPage());

class CupertinoLoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CupertinoLoading示例'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
//              strokeWidth: ,
            ),
            SizedBox(
              height: 50.0,
            ),
            CupertinoActivityIndicator(
              radius: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
