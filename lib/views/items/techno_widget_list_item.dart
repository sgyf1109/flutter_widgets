import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_star/flutter_star.dart';
import 'package:flutterwidgets/app/res/cons.dart';
import 'package:flutterwidgets/app/style/techno_shape.dart';
import 'package:flutterwidgets/blocs/collect/collect_bloc.dart';
import 'package:flutterwidgets/blocs/collect/collect_state.dart';
import 'package:flutterwidgets/compoents/permanent/circle_image.dart';
import 'package:flutterwidgets/compoents/permanent/circle_text.dart';
import 'package:flutterwidgets/compoents/permanent/tag.dart';

import 'package:flutterwidgets/model/widget_model.dart';

class TechnoWidgetListItem extends StatelessWidget {
  final WidgetModel data;

  TechnoWidgetListItem({this.data});

  Color get itemColor =>
      Color(Cons.tabColors[data.family.index]); //枚举类通过index获取下标

  @override
  Widget build(BuildContext context) {
    print("family" +
        "${data.family.index}+=====+${data.toString()}+======${data.family.toString()}");
    return Stack(
      children: <Widget>[
        Material(
          color: itemColor.withAlpha(66),
          shape: TechnoShapeBorder(color: itemColor),
          child: Container(
            height: 95,
            padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
            child: Row(
              children: <Widget>[
                Wrap(
                  //流式布局
                  spacing: 5,
                  direction: Axis.vertical,
                  //主轴（mainAxis）的方向，默认为水平。
                  alignment: WrapAlignment.center,
                  //WrapAlignment.start,//主轴方向上的对齐方式，默认为start。
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    _buildLeading(),
                    StarScore(
                      star: Star(
                          emptyColor: Colors.white,
                          size: 12,
                          fillColor: itemColor),
                      score: data.lever,
                    )
                  ],
                ),
                Expanded(
                    child: Column(
                  //Expanded这个控件会把同级别的控件，在父控件中填充满整个父控件。
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[_buildTitle(), _buildSummary()],
                ))
              ],
            ),
          ),
        ),
        _buildCollectTag(Theme.of(context).primaryColor)
      ],
    );
  }

  Widget _buildLeading() {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Hero(
          tag: "hero_widget_image_${data.name}",
          child: data.image == null
              ? Material(
                  color: Colors.transparent,
                  child: CircleText(
                    text: data.name,
                    size: 60,
                    color: itemColor,
                  ),
                )
              : CircleImage(
                  image: data.image,
                  size: 55,
                )),
    ); //Hero 指的是可以在路由(页面)之间“飞行”的 widget,两个页面同一个widget之间的动画
  }

  Widget _buildTitle() {
    return Row(
      children: <Widget>[
        SizedBox(
          //能强制子控件具有特定宽度、高度或两者都有,使子控件设置的宽高失效
          width: 10,
        ),
        Expanded(
            child: Text(
          data.name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              shadows: [Shadow(color: Colors.white, offset: Offset(0.3, 0.3))]),
        ))
      ],
    );
  }

  Widget _buildSummary() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Text(
        //尾部摘要
        data.info,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
            shadows: [Shadow(color: Colors.white, offset: Offset(.5, .5))]),
      ),
    );
  }

  Widget _buildCollectTag(Color color) {
    return Positioned(
        top: 0,
        right: 40,
        child:
            BlocBuilder<CollectBloc, CollectState>(builder: (context, state) {//它处理在构建部件的过程中的不同的状态。
          var show = state.widgets.contains(data);
          return Opacity(
            opacity: show ? 1.0 : 0.0,
            child: SizedOverflowBox(
              alignment: Alignment.bottomCenter,
              size: Size(0, 22),
              child: Tag(
                color: color,
                shadowHeight: 8.0,
                size: Size(20, 30),
              ),
            ),
          );
        }
        )); //Positioned一般配合stack使用left、top 、right、 bottom分别代表离Stack左、上、右、底四边的距离
  }
}
