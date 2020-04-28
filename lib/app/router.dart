import 'package:flutter/material.dart';
import 'package:flutterwidgets/views/pages/about/about_app_page.dart';
import 'package:flutterwidgets/views/pages/about/about_me_page.dart';
import 'package:flutterwidgets/views/pages/collect_page.dart';
import 'package:flutterwidgets/views/pages/detail/widget_detail_page.dart';
import 'package:flutterwidgets/views/pages/navigation/unit_navigation.dart';
import 'package:flutterwidgets/views/pages/search/search_page.dart';
import 'package:flutterwidgets/views/pages/setting/code_style_setting.dart';
import 'package:flutterwidgets/views/pages/setting/setting_page.dart';
import 'package:flutterwidgets/views/pages/setting/theme_color_setting.dart';
import 'package:flutterwidgets/views/pages/settings/font_setting.dart';
import 'package:flutterwidgets/views/pages/settings/item_style_setting.dart';
import 'package:flutterwidgets/views/pages/unit_todo/attr_unit_page.dart';
import 'package:flutterwidgets/views/pages/unit_todo/bug_unit_page.dart';
import 'package:flutterwidgets/views/pages/unit_todo/layout_unit_page.dart';
import 'package:flutterwidgets/views/pages/unit_todo/paint_unit_page.dart';


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
      case search:
        return Right2LeftRouter(child: SearchPage());
      case collect:
        return Right2LeftRouter(child: CollectPage());
      case setting:
        return Right2LeftRouter(child: SettingPage());
      case theme_color_setting:
        return Right2LeftRouter(child: ThemeColorSettingPage());
      case font_setting:
        return Right2LeftRouter(child: FontSettringPage());
      case item_style_setting:
        return Right2LeftRouter(child: ItemStyleSettingPage());
      case code_style_setting:
        return Right2LeftRouter(child: CodeStyleSettingPage());
      case attr:
        return Right2LeftRouter(child: AttrUnitPage());
      case paint:
        return Right2LeftRouter(child: PaintUnitPage());
      case layout:
        return Right2LeftRouter(child: LayoutUnitPage());
      case bug:
        return Right2LeftRouter(child: BugUnitPage());
      case about_app:
        return Right2LeftRouter(child: AboutAppPage());
      case about_me:
        return Right2LeftRouter(child: AboutMePage());
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
