import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_star/star.dart';
import 'package:flutter_star/star_score.dart';
import 'package:flutterwidgets/app/res/cons.dart';
import 'package:flutterwidgets/app/style/shape/techno_shape.dart';
import 'package:flutterwidgets/compoents/permanent/circle_image.dart';
import 'package:flutterwidgets/compoents/permanent/circle_text.dart';
import 'package:flutterwidgets/compoents/permanent/feedback_widget.dart';
import 'package:flutterwidgets/model/widget_model.dart';


class CollectWidgetListItem extends StatelessWidget {
  final WidgetModel data;
  final Function(WidgetModel) onDelectItemClick;
  CollectWidgetListItem({this.data,this.onDelectItemClick});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Material(
          color: itemColor.withAlpha(66),
          shape: TechnoShapeBorder(color: itemColor),
          child: Container(
            height: 95,
            padding: EdgeInsets.only(top: 10, left: 5, right: 10, bottom: 5),
            child: Row(
              children: <Widget>[
                _buildLeading(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildTitle(),
                      _buildSummary(),
                      StarScore(
                        star: Star(
                            emptyColor: Colors.white,
                            size: 12,
                            fillColor: itemColor),
                        score: data.lever,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 5,
            right: 5,
            child: FeedbackWidget(
              onPressed: (){
                if(onDelectItemClick!=null){
                  onDelectItemClick(data);
                }
              },
              child: Icon(
                CupertinoIcons.delete_solid,
                color: Colors.red,
              ),
            ))
      ],
    );
  }

  Widget _buildLeading() => Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: data.image == null
            ? Material(
                color: Colors.transparent,
                child: CircleText(
                  text: data.name,
                  size: 50,
                  color: itemColor,
                ),
              )
            : CircleImage(
                image: data.image,
                size: 50,
              ),
      );

  Color get itemColor => Color(Cons.tabColors[data.family.index]);

  Widget _buildTitle() {
    return Row(
      children: <Widget>[
//        SizedBox(width: 10),
        Expanded(
          child: Text(data.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(color: Colors.white, offset: Offset(.3, .3))
                  ])),
        ),
      ],
    );
  }

  Widget _buildSummary() {
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 10, top: 5),
      child: Container(
        child: Text(
          data.nameCN,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
              shadows: [Shadow(color: Colors.white, offset: Offset(.5, .5))]),
        ),
      ),
    );
  }
}
