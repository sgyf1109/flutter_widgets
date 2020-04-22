import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    print("空数据");
    return Container(
      height: 300,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.style,color: Colors.grey,size: 80.0,),
          Container(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              "暂无数据",
              style: TextStyle(
                color: Colors.grey
              ),
            ),
          )
        ],
      ),
    );
  }
}