import 'package:flutter/material.dart';

/// create by 小官在江湖 on 2020-03-31
/// contact me by email 1981462002@qq.com
/// 说明:
//    {
//      "widgetId": 193,
//      "name": 'AboutListTile基本使用',
//      "priority": 1,
//      "subtitle":
//          "【icon】 : 左图标   【Widget】\n"
//          "【applicationIcon】 : 左上图标   【Widget】\n"
//          "【applicationVersion】 : 版本号  【String】\n"
//          "【applicationName】 : 应用名  【String】\n"
//          "【applicationLegalese】 : 应用律术   【String】\n"
//          "【aboutBoxChildren】 : 弹框内容组件   【List<Widget>】",
//    }
class AboutListTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AboutListTile(
      child: Text("应用信息"),
      icon: Icon(Icons.info),
      applicationIcon: FlutterLogo(),
      applicationName: 'Flutter Unit',
      applicationVersion: 'v0.0.1',
      applicationLegalese: 'Copyright© 2018-2020 小官在江湖',
      aboutBoxChildren: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            '      FlutterUnit是【小官在江湖】的开源项目，'
            '收录Flutter的200+组件，并附加详细介绍以及操作交互，'
            '希望帮助广大编程爱好者入门Flutter。'
            '更多知识可以关注掘金账号、公众号【编程之王】。',
            style: TextStyle(color: Color(0xff999999), fontSize: 16),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
