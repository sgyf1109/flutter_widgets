import 'package:flutter/material.dart';
import 'package:flutterwidgets/app/style/TolyIcon.dart';
import 'package:flutterwidgets/compoents/permanent/code/highlighter_style.dart';


class Cons {
  static String version = 'V1.0.0';

  static const MENU_INFO = <String>["关于", "帮助", "问题反馈"]; //菜单栏
  static const ICONS_MAP = {
    //底栏图标
    "图鉴": TolyIcon.icon_layout, "收藏": TolyIcon.icon_star,
//    "喜欢": Icons.favorite, "手册": Icons.class_,
//    "我的": Icons.account_circle,
  };

  static const rainbow = <int>[
    0xffff0000,
    0xffFF7F00,
    0xffFFFF00,
    0xff00FF00,
    0xff00FFFF,
    0xff0000FF,
    0xff8B00FF
  ];

  static const tabColors = [
    0xff44D1FD,
    0xffFD4F43,
    0xffB375FF,
    0xFF4CAF50,
    0xFFFF9800,
    0xFF00F1F1,
    0xFFDBD83F
  ];
  static const tabs = <String>[
    'Stles',
    'Stful',
    'Scrow',
    'Mcrow',
    'Sliver',
    'Proxy',
    'Other'
  ]; //标题列表

  static const fontFamilySupport = <String>[
    'local',
    'ComicNeue',
    'IndieFlower',
    'BalooBhai2',
    'Inconsolata',
    'Neucha'
  ];

  static var codeThemeSupport = <HighlighterStyle, String>{
    HighlighterStyle.fromColors(HighlighterStyle.gitHub):"GitHub - Power By 小官在江湖",
    HighlighterStyle.fromColors(HighlighterStyle.darkColor):"黑 - Power By 小官在江湖",
    HighlighterStyle.fromColors(HighlighterStyle.lightColor):"白 - Power By 小官在江湖",
    HighlighterStyle.fromColors(HighlighterStyle.zenburn):"zenburn - Power By 小官在江湖",
    HighlighterStyle.fromColors(HighlighterStyle.mf):"mf - Power By MF",
    HighlighterStyle.fromColors(HighlighterStyle.solarized):"cst - Power By cst",
  };


  static final themeColorSupport = <MaterialColor, String>{//color:Colors.red[100],给它一个值，
    Colors.red: "毁灭之红",
    Colors.orange: "愤怒之橙",
    Colors.yellow: "警告之黄",
    Colors.green: "伪装之绿",
    Colors.blue: "冷漠之蓝",
    Colors.indigo: "无限之靛",
    Colors.purple: "神秘之紫",
//    Colors.black: "归宿之黑",//系统默认黑色为static const Color black = Color(0xFF000000);其他颜色（除白色外）为MaterialColor,构造方法不一致，导致不能这样使用黑色,需要自定义黑色
    MaterialColor(0xff2D2D2D, <int, Color>{//构造方法黑色，0xff2D2D2D为默认值
      50: Color(0xFF8A8A8A),
      100: Color(0xFF747474),
      200: Color(0xFF616161),
      300: Color(0xFF484848),
      400: Color(0xFF3D3D3D),
      500: Color(0xff2D2D2D),
      600: Color(0xFF252525),
      700: Color(0xFF141414),
      800: Color(0xFF050505),
      900: Color(0xff000000),
    }): "归宿之黑"
  };

}

