import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterwidgets/app/res/cons.dart';
import 'package:flutterwidgets/blocs/global/global_bloc.dart';
import 'package:flutterwidgets/blocs/global/global_event.dart';
import 'package:flutterwidgets/blocs/global/global_state.dart';
import 'package:flutterwidgets/compoents/permanent/circle.dart';
import 'package:flutterwidgets/compoents/permanent/feedback_widget.dart';

class FontSettringPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("字体设置--font setting"),
      ),
      body: BlocBuilder<GlobalBloc, GlobalState>(
        builder: (context, state) {
          return _buildFontCell(
              context, Cons.fontFamilySupport, state.fontFamily);
        },
      ),
    );
  }

  Widget _buildFontCell(
      BuildContext context, List<String> fontFamilySupport, String fontFamily) {
    print("字体" + "${fontFamilySupport.toList()}+====${fontFamily.toString()}");
    return GridView.count(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
      shrinkWrap: true,
      //一旦它被ListView或者GridView嵌套，shrinkWrap需要设置true
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1.5,
      //宽高比
      children: fontFamilySupport.map((e) {
        return FeedbackWidget(
          a: 0.95,
          duration: Duration(milliseconds: 200),
          onPressed: () {
            BlocProvider.of<GlobalBloc>(context).add(EventSwitchFontFamily(e));
          },
          child: Card(
            child: GridTile(
              header: Container(
                padding: EdgeInsets.only(left: 10, right: 5),
                height: 30,
                decoration: BoxDecoration(
                  color: fontFamily == e
                      ? Colors.blue.withAlpha(88)
                      : Colors.grey.withAlpha(88),
                ),
                child: Row(
                  children: <Widget>[
                    Text(e,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: e,
                        )),
                    Spacer(),
                    if (fontFamily == e)
                      Circle(
                        color: Theme.of(context).primaryColor,
                      )
                  ],
                ),
              ),
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.blueAccent.withAlpha(22),
                    Colors.blueAccent.withAlpha(22),
                    Theme.of(context).primaryColor.withAlpha(88)
                  ])),
                  alignment: Alignment(0, 0.4),
                  child: Text("sgyf",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: e,
                      )),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
