import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/12 2:50 PM
/// email: jqbo84@163.com
///

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '个人中心',
        style: TextStyle(color: Color(0xffff0000), fontSize: 20.0),
      ),
    );
  }
}
