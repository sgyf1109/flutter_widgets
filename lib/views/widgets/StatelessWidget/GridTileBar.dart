import 'package:flutter/material.dart';


class CustomGridTileBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.blue.withAlpha(120),
      trailing: Icon(
        Icons.star,
        color: Colors.red,
      ),
      leading: CircleAvatar(
        backgroundImage: AssetImage("assets/images/wy_200x300.jpg"),
      ),
      title: Text("百里·巫缨"),
      subtitle: Text("倾国必倾城"),
    );
  }
}
