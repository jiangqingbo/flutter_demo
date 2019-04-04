import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/2 5:53 PM
/// email: jqbo84@163.com
///

void main() => runApp(MyApp());

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
    return Scaffold(
      body: Center(
        child: CupertinoAlertDialog(
          title: Text('标题'),
          content: Text('aaaa'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('确定'),
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return CupertinoAlertDialog(
                      title: Text('标题'),
                      content: Text('aaaa'),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text('确定'),
                          onPressed: (){

                          },
                        ),
                        CupertinoDialogAction(
                          child: Text('取消'),
                        ),
                      ],
                    );
                  });
              },
            ),
            CupertinoDialogAction(
              child: Text('取消'),
            ),
          ],
        ),
      ),
    );
  }
}
