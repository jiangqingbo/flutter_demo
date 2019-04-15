import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/3 3:59 PM
/// email: jqbo84@163.com
///

void main()=>runApp(MaterialApp(home: DismissiblePage(),));

class DismissiblePage extends StatelessWidget {

  final List<String> items = List.generate(20, (index) => 'item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dismissible示例'),),
      body: ListView.builder(itemBuilder: (context, index){
        final item = items[index];
        return Dismissible(
          onDismissed: (_){
            items.removeAt(index);
          },
          movementDuration: Duration(microseconds: 100),
          key: Key(item),
          child: ListTile(
            title: Text('$item'),
          ),
          background: Container(color: Color(0xffff0000),),
        );
      }),
    );
  }
}
