import 'package:flutter/material.dart';
import 'package:flutterwidgets/views/pages/detail/widget_detail_page.dart';
import 'package:flutterwidgets/views/pages/navigation/unit_navigation.dart';


import 'utils/router_utils.dart';

class Router {
  static const String detail = 'detail';
  static const String home = '/';
  static const String logo = 'logo';
  static const String search = 'search';
  static const String nav = 'nav';
  static const String widget_detail = 'WidgetDetail';
  static const String collect = 'CollectPage';

  static const String setting = 'SettingPage';
  static const String font_setting = 'FountSettingPage';
  static const String theme_color_setting = 'ThemeColorSettingPage';
  static const String code_style_setting = 'CodeStyleSettingPage';
  static const String item_style_setting = 'ItemStyleSettingPage';

  static const String attr = 'AttrUnitPage';
  static const String bug = 'BugUnitPage';
  static const String paint = 'PaintUnitPage';
  static const String layout = 'LayoutUnitPage';
  static const String about_me = 'AboutMePage';
  static const String about_app = 'AboutAppPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //根据名称跳转相应页面

      case nav:
        return Left2RightRouter(child: UnitNavigation());
      case widget_detail:
        return Right2LeftRouter(child: WidgetDetailPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
