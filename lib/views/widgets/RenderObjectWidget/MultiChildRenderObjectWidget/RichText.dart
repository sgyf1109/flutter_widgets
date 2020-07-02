import 'package:flutter/material.dart';
import 'package:flutterwidgets/app/utils/color_utils.dart';

//    {
//      "widgetId": 101,
//      "name": 'RichText基本使用',
//      "priority": 1,
//      "subtitle":
//          "【text】 : 文字   【TextSpan】\n"
//          "    其他属性与Text相同,详见之。",
//    }
class CustomRichText extends StatelessWidget {
  final str = "        发光强度简称光强，国际单位是（坎德拉）简写cd。"
      "1cd是指光源在指定方向的单位立体角内发出的光通量。"
      "光源辐射是均匀时，则光强为I=F/Ω，Ω为立体角，单位为球面度（sr）,F为光通量，"
      "单位是流明，对于点光源由I=F/4π 。光亮度是表示发光面明亮程度的，"
      "指发光表面在指定方向的发光强度与垂直且指定方向的发光面的面积之比，"
      "单位是坎德拉/平方米。对于一个漫散射面，尽管各个方向的光强和光通量不同，"
      "但各个方向的亮度都是相等的。电视机的荧光屏就是近似于这样的漫散射面，"
      "所以从各个方向上观看图像，都有相同的亮度感。";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10,
      ),
      child: RichText(
          text: TextSpan(
              children: str
                  .split("")//获取每一个字符
                  .map((str) => TextSpan(
                      text: str,
                      style: TextStyle(
                          fontSize: 14, color: ColorUtils.randomColor())))
                  .toList())),
    );
  }
}

//    {
//      "widgetId": 101,
//      "name": 'RichText包含其他组件',
//      "priority": 2,
//      "subtitle":
//          "使用WidgetSpan来承载普通组件，作为RichText的内容",
//    }
class RichTextWithWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'hello ',
        style: TextStyle(color: Colors.black, fontSize: 18),
        children: <InlineSpan>[//文字片段，类型 InlineSpan，通常我们会用TextSpan（它是InlineSpan的子类）
          WidgetSpan(//承载普通组件
              child: Image.asset(
                'assets/images/icon_head.png',
                width: 30,
              ),
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.ideographic),
          TextSpan(
            text: ' , welcome to ',
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
          WidgetSpan(
              child: FlutterLogo(),
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.ideographic),
          TextSpan(
            text: ' .\n',
          ),
          TextSpan(
            text: 'focus me on ',
            style: TextStyle(color: Colors.orange, fontSize: 16),
          ),
          TextSpan(
            text: 'https://github.com/toly1994328',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                decoration: TextDecoration.underline),
          ),
          TextSpan(
            text: ' .\n',
          ),
        ],
      ),
    );
  }
}
