import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/2 4:38 PM
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SimpleDialog(
              title: Text('对话框标题'),
              children: <Widget>[
                SimpleDialogOption(
                  child: Text('选项1'),
                  onPressed: () {
                    print('选项1');
                  },
                ),
                SimpleDialogOption(
                  child: Text('选项2'),
                  onPressed: () {
                    print('选项2');
                  },
                ),
              ],
            ),
            RaisedButton(
              child: Text('删除'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('提示'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('是否删除？'),
                              Text('删除后不可恢复！'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('确定'),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return SimpleDialog(
                                    title: Text('提醒'),
                                    children: <Widget>[
                                      SimpleDialogOption(
                                        child: Text('已经删除了'),
                                        onPressed: () {
                                          print('已经删除了');
                                        },
                                      ),
                                      SimpleDialogOption(
                                        child: Text('数据不可恢复了，晚了'),
                                        onPressed: () {
                                          print('数据不可恢复了，晚了');
                                        },
                                      ),
                                      FlatButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                });
                            },
                          ),
                          FlatButton(
                            child: Text('取消'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
