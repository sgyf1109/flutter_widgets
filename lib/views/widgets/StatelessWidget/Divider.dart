import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dataColor = [
      Colors.red, Colors.yellow,
      Colors.blue, Colors.green];
    var dataThickness = [1.0, 2.0, 4.0, 6.0];
    var data = Map.fromIterables(dataColor, dataThickness);// 将指定的keys和values关联，创建一个Map实例。
    return Column(
      children: dataColor
          .map((e) => Divider(
                color: e,
                thickness: data[e],
              ))
          .toList(),
    );
  }
}

class HeightDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dataColor = [
      Colors.red, Colors.yellow,
      Colors.blue, Colors.green];
    var dataThickness = [10.0, 20.0, 30.0, 40.0];
    var data = Map.fromIterables(dataColor, dataThickness);
    return Column(
      children: dataColor
          .map((e) => Divider(
        color: e,
        indent:data[e],//前面空缺长度
        endIndent: data[e]*2,//后面空缺长度
        height: data[e],
        thickness: data[e]/10,
      ))
          .toList(),
    );
  }
}
