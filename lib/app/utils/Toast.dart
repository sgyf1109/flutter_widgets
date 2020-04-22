import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Toast {
  static toast(BuildContext context, String msg,
      {duration = const Duration(milliseconds: 600)}) {
    Scaffold.of(context).showSnackBar(SnackBar(//作为组件来说是一个简单的结构组件，可指定形状、影深、背景色等。一般通过ScaffoldState的showSnackBar方法从底部弹出。
      content: Text(msg),
      duration: duration,
      backgroundColor: Theme.of(context).primaryColor,
    ));
  }
}
