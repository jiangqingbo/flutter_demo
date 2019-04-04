import 'package:flutter/material.dart';

///
/// author: bobo
/// create time: 2019/4/3 3:32 PM
/// email: jqbo84@163.com
///

void main()=>runApp(MaterialApp(
  home: HomePage(),
));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('onTap');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Theme.of(context).buttonColor,
        ),
        padding: EdgeInsets.all(20.0),
        child: Text('MyButton', style: TextStyle(decoration: TextDecoration.none),),
      ),
    );
  }
}
