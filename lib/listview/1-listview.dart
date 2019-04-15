import 'package:flutter/material.dart';
import 'package:flutterdemo/utils/flutter_toast_utils.dart';

///
/// author: bobo
/// create time: 2019/4/1 4:10 PM
/// email: jqbo84@163.com
///

void main() => runApp(ListViewPage());

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ListView示例'),
        ),
        body:
//        new NormalListView(),
//          new HorizontalListView(),
//            new BuilderListView(),
        ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.looks_one),
              title: Text('NormalListView'),
              subtitle: Text('普通的ListTile加载数据'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> NormalListView()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.looks_two),
              title: Text('BuilderListView'),
              subtitle: Text('ListView.builder加载数据'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BuilderListView()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.looks_3),
              title: Text('HorizontalListView'),
              subtitle: Text('List.generate加载数据'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HorizontalListView()));
              },
            ),
          ],
        ),
    );
  }
}

class BuilderListView extends StatelessWidget {
  const BuilderListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BuilderListView示例'),),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            print('$index');
            if (index.isOdd) {
              return Divider();
            }
            return ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('${index + 1}号技师'),
              subtitle: Text('非常棒的'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HorizontalListView();
                }));
              },
            );
          }),
    );
  }
}

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HorizontalListView示例'),),
      body: ListView(
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
      ),
    );
  }
}

class NormalListView extends StatelessWidget {
  const NormalListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NormalListView示例'),),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('favorite_border'),
            subtitle: Text('children favorite_border'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
              ToastUtils.show('0.favorite_border');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('favorite_border'),
            subtitle: Text('children favorite_border'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
              ToastUtils.show('1.favorite_border');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('favorite_border'),
            subtitle: Text('children favorite_border'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
              ToastUtils.show('2.favorite_border');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('favorite_border'),
            subtitle: Text('children favorite_border'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
              ToastUtils.show('3.favorite_border');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('favorite_border'),
            subtitle: Text('children favorite_border'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
              ToastUtils.show('4.favorite_border');
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
