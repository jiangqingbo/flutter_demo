import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/1 9:32 PM
/// email: jqbo84@163.com
///

main()=>runApp(ListViewDismissiablePage());

class ListViewDismissiablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SwipeToDismissiableDemo();
  }
}

class SwipeToDismissiableDemo extends StatefulWidget {
  @override
  _SwipeToDismissiableDemoState createState() => _SwipeToDismissiableDemoState();
}

class _SwipeToDismissiableDemoState extends State<SwipeToDismissiableDemo> {

  List<String> list = List.generate(20, (index)=>'Item $index 元素');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("ListView.Dismissiable示例"),),
      body:ListView.builder(itemCount:list.length,
          itemBuilder: (context,index){

            return Dismissible(
              key: Key(list[index]),
              direction: DismissDirection.endToStart,
              child: ListTile(title: Text('${list[index]}')),
              background: Container(
                color: Colors.redAccent,
              ),
              onDismissed: (direction) {
                setState(() {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("${list[index]}")));
                  list.removeAt(index);
                });
              },

            );


          }) ,
    );
  }
}
