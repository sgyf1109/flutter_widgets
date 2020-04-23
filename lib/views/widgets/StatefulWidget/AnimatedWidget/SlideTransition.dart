import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//    {
//      "widgetId": 112,
//      "name": 'SlideTransition基本使用',
//      "priority": 1,
//      "subtitle":
//          "【child】 : 孩子组件   【Widget】\n"
//          "【textDirection】 : x轴方向  【TextDirection】\n"
//          "【position】 : 动画   【Animation<Offset>】",
//    }
class CustomSlideTransition extends StatefulWidget {
  @override
  _CustomSlideTransitionState createState() => _CustomSlideTransitionState();
}

class _CustomSlideTransitionState extends State<CustomSlideTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _ctrl;

  @override
  void initState() {
    _ctrl = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _ctrl.forward();
    super.initState();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _ctrl.reset();
            _ctrl.forward();
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.withAlpha(33),
          height: 100,
          child: SlideTransition(
            textDirection: TextDirection.ltr,
            position: Tween<Offset>(
              begin: Offset.zero,
              end: Offset(0.2, 0.2),
            ).animate(_ctrl),
            child: Container(
                child: Icon(Icons.android, color: Colors.green, size: 60)),
          ),
        ));
  }
}
