import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/2 4:54 PM
/// email: jqbo84@163.com
///

void main() => runApp(CardPage());

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card示例'),
        leading: Icon(Icons.payment),
      ),
      body: ListView(
        children: <Widget>[
          MyCardWidget(
            title: '书法家',
            subTitle: '棒棒的',
            icon: Icons.home,
            favoriteCount: 66,
            iconBgColor: Colors.blue,
            imageAssetPath: 'assets/images/xin.jpg',
          ),
          MyCardWidget(
            title: '书法家',
            subTitle: '真棒',
            icon: Icons.home,
            favoriteCount: 77,
            iconBgColor: Colors.orange,
            imageAssetPath: 'assets/images/hdzw.jpg',
          ),
          MyCardWidget(
            title: '书法家',
            subTitle: '很棒',
            icon: Icons.home,
            favoriteCount: 89,
            iconBgColor: Colors.red,
            imageAssetPath: 'assets/images/xin.jpg',
          ),
          MyCardWidget(
            title: '书法家',
            subTitle: '很棒',
            icon: Icons.home,
            favoriteCount: 89,
            iconBgColor: Colors.red,
            imageAssetPath: 'assets/images/hdzw.jpg',
          ),
          buildCard(),
          buildCard(),
          buildCard(),
        ],
      ),
    );
  }

  Widget buildCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/images/hdzw.jpg',
                width: double.infinity,
                height: 150.0,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: Icon(Icons.home),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '棒棒的',
                        style: TextStyle(fontSize: 22.0),
                      ),
                      Text(
                        '500',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.favorite,
                        color: Color(0xffff0000),
                      ),
                      Text('66'),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyCardWidget extends StatelessWidget {
  final String imageAssetPath;
  final IconData icon;
  final Color iconBgColor;
  final String title;
  final String subTitle;
  final int favoriteCount;

  const MyCardWidget(
      {Key key,
      this.imageAssetPath,
      this.icon,
      this.iconBgColor,
      this.title,
      this.subTitle,
      this.favoriteCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Card(
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            Image.asset(
              imageAssetPath,
              width: double.infinity,
              height: 150.0,
              fit: BoxFit.cover,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: iconBgColor,
                      borderRadius:
                          BorderRadius.all(const Radius.circular(15.0)),
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 2.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white,
                        Colors.grey,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                      Text(
                        '$favoriteCount',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
