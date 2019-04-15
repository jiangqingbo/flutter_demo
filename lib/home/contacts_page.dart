import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/12 2:50 PM
/// email: jqbo84@163.com
///

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '通信录',
        style: TextStyle(color: Color(0xffff0000), fontSize: 20.0),
      ),
    );
  }
}
