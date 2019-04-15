import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/1 5:58 PM
/// email: jqbo84@163.com
///

main() => runApp(LoginFromPage());

class LoginFromPage extends StatefulWidget {
  @override
  _LoginFromPageState createState() => _LoginFromPageState();
}

class _LoginFromPageState extends State<LoginFromPage> {
  GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  String _userName;
  String _password;

  void _login() {
    var _loginForm = _loginKey.currentState;
    if (_loginForm.validate()) {
      _loginForm.save();
      print('name: $_userName, password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('From表单示例'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                  key: _loginKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: '请输入用户名',
                        ),
                        onSaved: (value) {
                          print('onSaved :$value');
                          _userName = value;
                        },
                        onFieldSubmitted: (value) {
                          print('onFieldSubmitted : $value');
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: '请输入密码',
                        ),
                        obscureText: true,
                        onSaved: (value) {
                          _password = value;
                        },
                        validator: (value) {
                          return value.length < 6 ? '密码长度不够6位' : null;
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        width: 400.0,
                        height: 40.0,
                        child: RaisedButton(
                          onPressed: () {
                            _login();
                          },
                          child: Text('登录'),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
