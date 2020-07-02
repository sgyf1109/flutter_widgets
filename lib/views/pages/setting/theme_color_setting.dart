import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterwidgets/app/res/cons.dart';
import 'package:flutterwidgets/blocs/global/global_bloc.dart';
import 'package:flutterwidgets/blocs/global/global_event.dart';
import 'package:flutterwidgets/blocs/global/global_state.dart';
import 'package:flutterwidgets/compoents/permanent/circle.dart';
import 'package:flutterwidgets/compoents/permanent/feedback_widget.dart';

class ThemeColorSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("主题色设置"),
      ),
      body: BlocBuilder<GlobalBloc, GlobalState>(builder: (context, state) {
        return _buildFontCell(
            context, Cons.themeColorSupport.keys.toList(), state.themeColor);
      }),
    );
  }

  Widget _buildFontCell(BuildContext context,
      List<MaterialColor> themeColorSupport, MaterialColor color) {
    return GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
        shrinkWrap: true,
        children: themeColorSupport.map((e) {
          print("颜色======" + "${color.value}");
          return FeedbackWidget(
            child: GridTile(
              //GridTile主要作为GridView子child,提供丰富的页眉和页脚;
              header: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                  color: color == e
                      ? Colors.blue.withAlpha(88):
                  Colors.grey.withAlpha(55),
                ),
                padding: EdgeInsets.only(left: 10, right: 5),
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Text(
                      colorString(color),
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    if (color == e) //小白点
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Circle(
                          color: Colors.white,
                          radius: 7,
                        ),
                      )
                  ],
                ),
              ),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(colors: [
                        e[50],
                        e[100],
                        e[200],
                        e[300],
                        e[400],
                        e[500],
                        e[600],
                        e[700],
                        e[800],
                        e[900],
                      ])),
                  alignment: Alignment(0, 0.35),
                  child: Text(
                    Cons.themeColorSupport[e],
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            onPressed: () {
              BlocProvider.of<GlobalBloc>(context).add(EventSwitchThemeColor(e));
            },
            a: 0.95,
            duration: Duration(milliseconds: 20),
          );
        }).toList());
  }

  String colorString(Color color) {
    print("颜色" + "${color.value}");
    return "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}"; //toRadixString整型转换为16进制,padLeft在字符串左侧补占位符
  }
}
