import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/3/27 3:43 PM
/// email: jqbo84@163.com
///

void main() => runApp(MaterialApp(
      title: 'Simple Login',
      home: LoginPage(),
    ));

class LoginPage extends StatelessWidget {
  GlobalKey<FormState> _loginKey = GlobalKey();

  String _username;
  String _password;

  void _login() {
    var loginForm = _loginKey.currentState;
    if (loginForm.validate()) {
      loginForm.save();
      print('user name: $_username ---------- password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Login'),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _loginKey,
            child: Center(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: '请输入登录用户名',
                        hintText: '请输入登录用户名',
                        border: OutlineInputBorder()),
                    onSaved: (val) {
                      _username = val;
                    },
                    onFieldSubmitted: (val) {},
                    validator: (val) {
                      if (val.length == 0) return '用户名不能为空';
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: '请输入密码',
                        hintText: '请输入密码',
                        border: OutlineInputBorder()),
                    obscureText: true,
                    onSaved: (val) {
                      _password = val;
                    },
                    onFieldSubmitted: (val) {},
                    validator: (val) {
                      if (val.length < 3) return '密码不能少于3个字符';
                      if (val.length > 6)
                        return '密码不能大于6个字符';
                      else
                        return null;
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.0),
                    child: SizedBox(
                      width: 400.0,
                      height: 45.0,
                      child: RaisedButton(
                        onPressed: _login,
                        child: Text('登录',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
