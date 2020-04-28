import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      alignment: FractionalOffset.center,//Aligment的坐标系原点是在父控件的中间，而FractionalOffset的坐标系是在父控件的左上角
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
           Icon(Icons.event_busy, color: Colors.orangeAccent, size: 120.0),
           Container(
            padding:  EdgeInsets.only(top: 16.0),
            child:  Text(
              "没数据，哥也没办法，(≡ _ ≡)/~┴┴",
              style:  TextStyle(
                fontSize: 20,
                color: Colors.orangeAccent,
              ),
            ),
          )
        ],
      ),
    ),);
  }
}
