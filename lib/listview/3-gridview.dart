import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/1 5:52 PM
/// email: jqbo84@163.com
///

void main() => runApp(GridViewPage());

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView示例'),
      ),
      body:
//          GridView.count(
//            crossAxisCount: 2, //交叉轴
////            scrollDirection: Axis.horizontal,
//            childAspectRatio: 3 / 4, //1.0宽高比
//            children: List.generate(100, (index) {
//              return Container(
//                color: Color(0xffff0000),
//                margin: EdgeInsets.all(10.0),
//                child: Text(
//                  '$index',
//                  style: TextStyle(fontSize: 20.0),
//                ),
//              );
//            }),

          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
              ),
              itemCount: 100,
              itemBuilder: (context, index) {
                print('$index');
                return Container(
                  color: Color(0xffff0000),
                  margin: EdgeInsets.all(10.0),
                  alignment: Alignment(0.0, 0.0),
                  child: Text(
                    '${index + 1}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0, color: Color(0xffffffff)),
                  ),
                );
              }),
    );
  }
}
