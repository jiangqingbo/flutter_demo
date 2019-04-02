import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/1 9:32 PM
/// email: jqbo84@163.com
///

main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '动脑学院',
      theme: ThemeData.dark(),
      home: SwipeToDismissiableDemo(),
    );
  }
}

class SwipeToDismissiableDemo extends StatefulWidget {
  @override
  _SwipeToDismissiableDemoState createState() => _SwipeToDismissiableDemoState();
}

class _SwipeToDismissiableDemoState extends State<SwipeToDismissiableDemo> {

  List<String> list = List.generate(20, (index)=>'动脑学院 $index 元素');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("动脑学院2"),),
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
