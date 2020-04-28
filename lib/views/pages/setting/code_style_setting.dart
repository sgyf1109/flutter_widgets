import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterwidgets/app/res/cons.dart';
import 'package:flutterwidgets/blocs/global/global_bloc.dart';
import 'package:flutterwidgets/blocs/global/global_event.dart';
import 'package:flutterwidgets/blocs/global/global_state.dart';
import 'package:flutterwidgets/compoents/permanent/circle.dart';
import 'package:flutterwidgets/compoents/permanent/code/code_widget.dart';
import 'package:flutterwidgets/compoents/permanent/code/highlighter_style.dart';
import 'package:flutterwidgets/compoents/permanent/feedback_widget.dart';

class CodeStyleSettingPage extends StatelessWidget {
  final code = """
const String _kCounty = 'China';

class Hello {
  final String name;//言语
  final String county;//国家
  final int age;//年龄

  Hello({
    this.name = "小官在江湖",
    this.age = 29,
    this.county = _kCounty
  });
}"""; //使用三个单引号或者三个双引号可以创建多行字符串对象：

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("代码高亮显示"),
      ),
      body: BlocBuilder<GlobalBloc, GlobalState>(builder: (context, state) {
        return _buildFontCell(
            context, Cons.codeThemeSupport.keys.toList(), state.codeStyleIndex);
      }),
    );
  }

  Widget _buildFontCell(
      BuildContext context, List<HighlighterStyle> list, int codeStyleIndex) {
    return ListView.builder(itemCount: list.length,itemBuilder: (context, index) {
      return FeedbackWidget(
          a: 0.95,
          duration: Duration(milliseconds: 200),
          child: Stack(
            fit: StackFit.passthrough,
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(10),
                child: CodeWidget(
                  code: code,
                  style: list[index],
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: Text(
                  Cons.codeThemeSupport.values.toList()[index],
                  style: TextStyle(
                      fontSize: 14,
                      color: list[index].stringStyle.color,
                      shadows: [
                        Shadow(
                            color: Colors.white,
                            offset: Offset(.5, .5),
                            blurRadius: 1),
                      ]),
                ),
              ),
              if(index == codeStyleIndex)
                Positioned(
                  right: 20,
                  top: 20,
                  child: Circle(radius: 10,
                    color: Theme.of(context).primaryColor,
                    child: Icon(Icons.check,color:Colors.white,size: 15,),),
                )
            ],
          ),
          onPressed: () {
            BlocProvider.of<GlobalBloc>(context)
                .add(EventSwitchCoderTheme(index));
          });
    });
  }
}
