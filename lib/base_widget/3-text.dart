import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

///
/// author: bobo
/// create time: 2019/4/1 2:56 PM
/// email: jqbo84@163.com
///

void main() => runApp(TextPage());

// Text RickText
class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text示例'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '做一位受人尊敬的程序猿，是我们一直以来的追求！',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(
                fontSize: 30.0,
                decoration: TextDecoration.lineThrough,
                decorationStyle: TextDecorationStyle.wavy,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                text: '做一位受人尊敬的程序猿, ',
                style: TextStyle(color: Colors.red, fontSize: 20.0),
                children: <TextSpan>[
                  TextSpan(text: '是我们一直以来的追求！'),
                  TextSpan(
                      text: 'Github',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          String url = 'https://github.com/jiangqingbo/flutter_demo';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'error: $url';
                          }
                        }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
