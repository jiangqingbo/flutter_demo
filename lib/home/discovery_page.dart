import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/12 2:50 PM
/// email: jqbo84@163.com
///

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '发现',
        style: TextStyle(color: Color(0xffff0000), fontSize: 20.0),
      ),
    );
  }
}
