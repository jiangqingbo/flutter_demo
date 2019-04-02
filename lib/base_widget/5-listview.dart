import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/1 4:10 PM
/// email: jqbo84@163.com
///

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('ListView示例'),
          ),
          body:
//        new NormalListView(),
//          new HorizontalListView(),
              new BuilderListView()),
    );
  }
}

class BuilderListView extends StatelessWidget {
  const BuilderListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          print('$index');
          if(index.isOdd){
            return Divider();
          }
          return ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('${index + 1}号技师'),
            subtitle: Text('非常棒的'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HorizontalListView();
              }));
            },
          );
        });
  }
}

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(50, (index) {
        return Center(
          child: Container(
            height: 100.0,
            width: 100.0,
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment(0, 0),
            decoration: BoxDecoration(
              color: Color(0xff0000ff),
            ),
            child: Text(
              '$index',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xffff0000),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class NormalListView extends StatelessWidget {
  const NormalListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text('favorite_border'),
          subtitle: Text('children favorite_border'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text('favorite_border'),
          subtitle: Text('children favorite_border'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text('favorite_border'),
          subtitle: Text('children favorite_border'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text('favorite_border'),
          subtitle: Text('children favorite_border'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text('favorite_border'),
          subtitle: Text('children favorite_border'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(),
      ],
    );
  }
}
