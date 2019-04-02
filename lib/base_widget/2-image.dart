import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

///
/// author: bobo
/// create time: 2019/3/27 2:10 PM
/// email: jqbo84@163.com
///
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 添加调试布局线条
//    debugPaintSizeEnabled = true;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image示例demo'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              // 1.加载网络图片
              Image.network(
                'https://www.baidu.com/img/bd_logo1.png?where=super',
                width: 100,
                height: 100,
              ),

              // 2.加载Assets资源
              Image.asset(
                'assets/images/hdzw.jpg',
                width: 400,
                height: 200,
              ),

              // 3.加载内存Memory资源
              MemoryImageWidget(),

              // 4.从文件加载图片
              FileImageWidget(),

            ],
          ),
        ),
      ),
    );
  }
}

/// 快捷键：stf -> StatefulWidget， stl -> StatelessWidget
class MemoryImageWidget extends StatefulWidget {
  @override
  _MemoryImageWidgetState createState() => _MemoryImageWidgetState();
}

class _MemoryImageWidgetState extends State<MemoryImageWidget> {
  Uint8List bytes;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/images/xin.jpg').then((data) {
      if (mounted) {
        setState(() {
          bytes = data.buffer.asUint8List();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _decoration = BoxDecoration(
      image: bytes == null ? null : DecorationImage(image: MemoryImage(bytes)),
      border: Border.all(color: Colors.red, width: 3),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: Colors.transparent,
    );
    return Container(
      width: 300,
      height: 150,
      decoration: _decoration,
    );
  }
}

/// 从sdcard获取图片文件
class FileImageWidget extends StatefulWidget {
  @override
  _FileImageWidgetState createState() => _FileImageWidgetState();
}

class _FileImageWidgetState extends State<FileImageWidget> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: _image == null
              ? Text('为选择图片')
              : Image.file(
                  _image,
                  width: 150,
                  height: 150,
                ),
        ),
        FlatButton(
          onPressed: getImage,
          child: Text(
            '选择图片',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
