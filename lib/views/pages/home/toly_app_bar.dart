import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwidgets/app/res/cons.dart';
import 'package:flutterwidgets/compoents/permanent/circle.dart';

class TolyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function(int, Color) onItemClick;
  final Size preferredSize;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TolyAppBarState();
  }

  TolyAppBar({
    this.onItemClick,
    this.preferredSize,
  });
}

class _TolyAppBarState extends State<TolyAppBar>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double factor = 1.0;
  double _width = 0;
  List<int> colors = Cons.tabColors;
  List info = Cons.tabs;
  int _selectIndex = 0;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this)
          ..addListener(() => setState((){
            return factor = _controller.value;
          }))
          ..addStatusListener((s) {
            if (s == AnimationStatus.completed) {
              setState(() {});
            }
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width / colors.length;
    return Container(
        alignment: Alignment.center,
        child: Flow(
          delegate: TolyAppBarDelegate(//控制子控件的摆放。
              _selectIndex, factor, widget.preferredSize.height),
          children:
          <Widget>[
            ...colors.map((e) {
              var isSelected = _selectIndex == colors.indexOf(e);
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.reset();
                      _controller.forward();
                      _selectIndex = colors.indexOf(e);
                      if (widget.onItemClick != null)
                        widget.onItemClick(_selectIndex, Color(e));
                    });
                  },
                  child: Container(
                    alignment: Alignment(0, 0.4),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: isSelected
                                  ? Colors.transparent
                                  : Color(colors[_selectIndex]),
                              offset: Offset(1, 1),
                              blurRadius: 2)
                        ],
                        color: Color(e),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        )),
                    height: widget.preferredSize.height,
                    width: _width,
                    child: Text(
                      info[colors.indexOf(e)],
                      style: TextStyle(color: Colors.white, shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(0.5, 0.5),
                            blurRadius: 0.5)
                      ]),
                    ),
                  ));
            }).toList(),
            ...colors.map((e) => Circle(
                  color: Color(e),
                  radius: 6,
                )).toList(),
          ],
        ));
  }
}

class TolyAppBarDelegate extends FlowDelegate {
  final int selectIndex;
  final double factor;
  final double height;

  TolyAppBarDelegate(this.selectIndex, this.factor, this.height);

  @override
  void paintChildren(FlowPaintingContext context) {
    double ox = 0;
    double obx = 0;
//    print("子控件"+"${context.childCount}+====+${factor}");
    for (int i = 0; i < context.childCount/2; i++) {
      var cSize = context.getChildSize(i);
      if (i == selectIndex) {
        context.paintChild(i,
            transform: Matrix4.translationValues(ox, 20*factor-20, 0.0));//选中的tabar
        ox += cSize.width;
      }
      else {
        context.paintChild(i,
            transform: Matrix4.translationValues(ox, -20, 0.0));//未选中的tabar
        ox += cSize.width;
      }
    }
    for (int i = (context.childCount / 2).floor();//floor()向下取整
        i < context.childCount;
        i++) {
      if (i - (context.childCount / 2).floor() == selectIndex) {
        obx += context.getChildSize(0).width;
      } else {
        context.paintChild(i,
            transform: Matrix4.translationValues(
                obx + context.getChildSize(0).width / 2 - 5, height + 5, 0));
        obx += context.getChildSize(0).width;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return true;
  }
}
