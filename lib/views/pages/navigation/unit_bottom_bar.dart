

import 'package:flutter/material.dart';

class UnitBottomBar extends StatefulWidget{
  final Color color;
  final Map<String, IconData> itemData;
  final Function(int) onItemClick;

  UnitBottomBar(
      {this.color = Colors.blue,
        @required this.itemData,
        @required this.onItemClick});//@required表示如果填入该参数，值必须填入,而不是该参数必须填入

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UnitBottomBarState();
  }
}

class _UnitBottomBarState extends State<UnitBottomBar>{
  int _position = 0;
  List<String> get info => widget.itemData.keys.toList();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomAppBar(
      elevation: 0,
      shape: CircularNotchedRectangle(),//有缺口的圆形矩形
      //圆弧弧度
      notchMargin: 5,
      color: widget.color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:widget.itemData.keys.map((e)=>_buildChild(info.indexOf(e),widget.color)).toList()
      ),
    );
  }

 Widget _buildChild(int i, Color color) {
   var active = i == _position;
   bool left=i==0;
   return GestureDetector(
     onTap: (){
       setState(() {
         _position=i;
         if (widget.onItemClick != null) {
           widget.onItemClick(_position);
         }
       });
     },

     child: Material(//Material是个没有实际效果的控件
       elevation: 2,
       shape: RoundedRectangleBorder(
           borderRadius: left//判断是第一个控件
               ? BorderRadius.only(topRight: Radius.circular(10))
               : BorderRadius.only(topLeft: Radius.circular(10))),
       child: Container(
           margin: left
               ? EdgeInsets.only(top: 2, right: 2)
               : EdgeInsets.only(top: 2, left: 2),
           alignment: Alignment.center,
           decoration: BoxDecoration(
               color: color.withAlpha(88),
               borderRadius: left
                   ? BorderRadius.only(topRight: Radius.circular(10))
                   : BorderRadius.only(topLeft: Radius.circular(10))),
           height: 45,
           width: 100,
           child: Icon(
             widget.itemData[info[i]],
             color: active ? color : Colors.white,
             size: active ? 28 : 24,
           )),
       ),
     );
 }
}