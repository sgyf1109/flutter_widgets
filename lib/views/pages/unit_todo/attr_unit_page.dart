import 'package:flutter/material.dart';
import 'package:flutterwidgets/compoents/permanent/animated_text.dart';

class AttrUnitPage extends StatelessWidget {
  final info = '【Flutter属性集录】是Unit项目计划的第二阶段的功能之一。'
      '会对所有Widget的所有属性进行收录整理到数据库，进行数据分析和组件关联。'
      '并且对一些重要属性，进行全面讲解。';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("属性集录"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              //需声明属性才居中生效
              top: 50,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/icon_head.png'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Flutter Unit 2.0 计划',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: ShaderMask(
              shaderCallback: (rect) {
               return _buildShader(rect, Theme.of(context).primaryColor);
              },
              child: AnimatedText(
                info,
                0,
                durationInMilliseconds: 5000,
                textStyle: TextStyle(
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(1, 1),
                          blurRadius: 1)
                    ],
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  Shader _buildShader(Rect rect, Color primaryColor) {
    //LinearGradient], [RadialGradient], [SweepGradient}继承gradient，gradient继承shader
    return RadialGradient(colors: [
      primaryColor.withAlpha(88),
      primaryColor.withAlpha(136),
      primaryColor
    ], tileMode: TileMode.mirror, radius: 1, center: Alignment.topLeft)
        .createShader(rect);
  }
}
