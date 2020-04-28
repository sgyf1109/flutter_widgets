import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/drawer_head.jpg'),
                fit: BoxFit.cover),
//            borderRadius: BorderRadius.only(
//                bottomRight: Radius.circular(400),
//                topLeft: Radius.circular(400))
        ),
      ),
    );
  }
}