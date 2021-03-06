import 'package:flutter/material.dart';

/// create by 小官在江湖 on 2020-03-29
/// contact me by email 1981462002@qq.com
/// 说明: 
//    {
//      "widgetId": 175,
//      "name": 'RawMaterialButton基本使用',
//      "priority": 1,
//      "subtitle":
//          "【child】 : 子组件   【Widget】\n"
//          "【elevation】 : 影深   【double】\n"
//          "【fillColor】 : 填充色   【Color】\n"
//          "【splashColor】 : 水波纹色   【Color】\n"
//          "【textStyle】 : 文字样式   【TextStyle】\n"
//          "【onLongPress】 : 长按事件   【Function()】\n"
//          "【onPressed】 : 点击事件  【Function()】",
//    }
class CustomRawMaterialButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 20,
        children: <Widget>[
          RawMaterialButton(
            elevation: 2,
            fillColor: Colors.green,
            splashColor: Colors.orange,
            textStyle: TextStyle(color: Colors.white),
            onLongPress: ()=>print('onLongPress'),
            child: Icon(Icons.remove),
            onPressed: ()=>print('onPressed'),
          ),
          RawMaterialButton(
            elevation: 2,
            fillColor: Colors.blue,
            splashColor: Colors.orange,
            textStyle: TextStyle(color: Colors.white),
            onLongPress: ()=>print('onLongPress'),
            child: Text('Push'),
            onPressed: ()=>print('onPressed'),
          ),
          RawMaterialButton(
            elevation: 2,
            fillColor: Colors.red,
            splashColor: Colors.orange,
            textStyle: TextStyle(color: Colors.white),
            onLongPress: ()=>print('onLongPress'),
            child: Icon(Icons.add),
            onPressed: ()=>print('onPressed'),
          ),

        ],
      ),
    );
  }
}

//    {
//      "widgetId": 175,
//      "name": 'RawMaterialButton基本使用',
//      "priority": 2,
//      "subtitle":
//          "【highlightElevation】 : 高亮影深   【double】\n"
//          "【shape】 : 形状   【ShapeBorder】",
//    }
class ShapeRawMaterialButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 20,
        children: <Widget>[
          RawMaterialButton(
            elevation: 2,
            shape:  CircleBorder(
              side: BorderSide(width: 2.0, color: Color(0xFFFFDFDFDF)),
            ),
            fillColor: Colors.green,
            splashColor: Colors.orange,
            textStyle: TextStyle(color: Colors.white),
            onLongPress: ()=>print('onLongPress'),
            child: Icon(Icons.remove),
            onPressed: ()=>print('onPressed'),
          ),
          RawMaterialButton(
            shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            elevation: 0,
            highlightElevation: 0,
            fillColor: Colors.blue,
            splashColor: Colors.orange,
            textStyle: TextStyle(color: Colors.white),
            onLongPress: ()=>print('onLongPress'),
            child: Text('Push'),
            onPressed: ()=>print('onPressed'),
          ),
          RawMaterialButton(
            elevation: 2,
            shape:  CircleBorder(
              side: BorderSide(width: 2.0, color: Color(0xFFFFDFDFDF)),
            ),
            fillColor: Colors.red,
            splashColor: Colors.orange,
            textStyle: TextStyle(color: Colors.white),
            onLongPress: ()=>print('onLongPress'),
            child: Icon(Icons.add),
            onPressed: ()=>print('onPressed'),
          ),

        ],
      ),
    );
  }
}