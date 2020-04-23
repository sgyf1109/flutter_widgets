import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterwidgets/app/utils/pather.dart';

class CustomFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = {
      Colors.red: Icons.add,
      Colors.blue: Icons.bluetooth,
      Colors.green: Icons.android,
    };
    return Wrap(
        spacing: 20,
        children: data.keys
            .map((e) => FloatingActionButton(
                  heroTag: e.toString()+"a",
                  onPressed: () {},
                  backgroundColor: e,
                  foregroundColor: Colors.white,
                  child: Icon(data[e]),
                  tooltip: "android",
                  elevation: 5, //z-阴影盖度
                ))
            .toList());
  }
}

class MiniFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = {
      Colors.red: Icons.add,
      Colors.blue: Icons.bluetooth,
      Colors.green: Icons.android,
    };
    return Wrap(
        spacing: 20,
        children: data.keys
            .map((e) => FloatingActionButton(
                  heroTag:  e.toString()+"b",
                  onPressed: () {},
                  backgroundColor: e,
                  mini: true,
                  foregroundColor: Colors.white,
                  child: Icon(data[e]),
                  tooltip: "android",
                  elevation: 5, //z-阴影盖度
                ))
            .toList());
  }
}

class ShapeFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = {
      Colors.red: Icons.add,
      Colors.blue: Icons.bluetooth,
      Colors.green: Icons.android,
    };
    return Wrap(
        spacing: 20,
        children: data.keys
            .map((e) => FloatingActionButton(
                  heroTag:  e.toString()+"c",
                  onPressed: () {},
                  backgroundColor: e,
                  shape: StarBorder(),
                  foregroundColor: Colors.white,
                  child: Icon(data[e]),
                  tooltip: "android",
                  elevation: 5,
                ))
            .toList());
  }
}

/// 边线形状类
class StarBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Pather.create.nStarPath(20, 25, 25 * cos((360 / 9 / 2) * pi / 180),
        dx: rect.height / 2, dy: rect.width / 2);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return null;
  }
}
