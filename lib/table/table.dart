import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/3 3:02 PM
/// email: jqbo84@163.com
///

main() => runApp(MaterialApp(
  home: TablePage(),
));

class TablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Table示例'),),
      body: Center(
        child: Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(50.0),
            1: FixedColumnWidth(100.0),
            2: FixedColumnWidth(50.0),
            3: FixedColumnWidth(50.0),
          },

          border: TableBorder.all(
              color: Color(0xffff0000),
              width: 0.5,
          ),
          children: const <TableRow>[
            TableRow(children: [
              Text('头像', textAlign: TextAlign.center, style: TextStyle(height: 2.0),),
              Text('姓名', textAlign: TextAlign.center, style: TextStyle(height: 2.0),),
              Text('年龄', textAlign: TextAlign.center, style: TextStyle(height: 2.0),),
              Text('身高', textAlign: TextAlign.center, style: TextStyle(height: 2.0),),
            ]),
            TableRow(children: [
              Icon(Icons.description),
              Text('10号技师'),
              Text('21'),
              Text('164'),
            ]),
            TableRow(children: [
              Icon(Icons.description),
              Text('15号技师'),
              Text('21'),
              Text('164'),
            ]),
            TableRow(children: [
              Icon(Icons.description),
              Text('20号技师'),
              Text('21'),
              Text('164'),
            ]),
          ],
        ),
      ),
    );
  }
}
