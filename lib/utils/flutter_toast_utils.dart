import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///
/// author: bobo
/// create time: 2019/4/12 5:54 PM
/// email: jqbo84@163.com
///

class ToastUtils {
  static void show(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Color(0xffcccccc),
      textColor: Color(0xff333333),
      fontSize: 16.0,
    );
  }
}