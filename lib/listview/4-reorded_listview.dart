import 'package:flutter/material.dart';
import 'dart:math';

///
/// author: bobo
/// create time: 2019/4/10 5:15 PM
/// email: jqbo84@163.com
///

void main() => runApp(MaterialApp(
  home: ReorderableListViewPage(),
));

class ReorderableListViewPage extends StatefulWidget {
  @override
  _ReorderableListViewPageState createState() => _ReorderableListViewPageState();
}

class _ReorderableListViewPageState extends State<ReorderableListViewPage> {
  List list = List.generate(Random().nextInt(15) + 10, (i) => 'Item $i');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReorderableListViewPage示例'),
      ),
      body: ReorderableListView(
        onReorder: _onReorder,
        children: list
            .map((m) => ListTile(
          key: ObjectKey(m),
          title: Text(m),
        ))
            .toList(),
      ),
    );
  }

  _onReorder(int oldIndex, int newIndex) {
    print('oldIndex: $oldIndex, newIndex: $newIndex');
    setState(() {
      if (newIndex == list.length) {
        newIndex = list.length - 1;
      }
      var item = list.removeAt(oldIndex);
      list.insert(newIndex, item);
    });
  }
}
