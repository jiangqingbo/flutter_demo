import 'package:flutter/material.dart';
import 'dart:math';

///
/// author: bobo
/// create time: 2019/4/10 5:24 PM
/// email: jqbo84@163.com
///

void main() => runApp(MaterialApp(
  home: ListViewPullToRefreshPage(),
));

class ListViewPullToRefreshPage extends StatefulWidget {
  @override
  _ListViewPullToRefreshPageState createState() => _ListViewPullToRefreshPageState();
}

class _ListViewPullToRefreshPageState extends State<ListViewPullToRefreshPage> {
  List list = List();
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _refresh();
    _scrollController = ScrollController()
      ..addListener(() {
        //判断是否滑到底
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          _loadMore();
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Future _loadMore() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        list.addAll(
            List.generate(Random().nextInt(5) + 1, (i) => 'more Item $i'));
      });
    });
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        list = List.generate(Random().nextInt(20) + 15, (i) => 'Item $i');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewPullToRefresh下拉刷新示例'),
      ),
      body: Center(
        child: RefreshIndicator(
            displacement: 10.0,
            child: list == null || list.isEmpty
                ? Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
                controller: _scrollController,
                itemCount: list.length + 1,
                itemBuilder: (context, index) {
                  if(index == list.length){
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return ListTile(
                    title: Text(list[index]),
                  );
                }),
            onRefresh: _refresh),
      ),
    );
  }
}
