import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/1 3:58 PM
/// email: jqbo84@163.com
///

void main() => runApp(IconsButtonsPage());

class IconsButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icons Button示例'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.person),
            SizedBox(
              height: 20.0,
            ),
            IconButton(icon: Icon(Icons.error), onPressed: () {}),
            Container(
              height: 20.0,
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('RaiseButton'),
            ),
          ],
        ),
      ),
    );
  }
}
