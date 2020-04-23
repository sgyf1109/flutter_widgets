import 'package:flutter/material.dart';


class CustomCircleAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage("assets/images/wy_200x300.jpg"),
      foregroundColor: Colors.white,
      child: Icon(
        Icons.check,
        size: 50,
      ),
    );
  }
}
