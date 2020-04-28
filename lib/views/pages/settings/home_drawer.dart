import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterwidgets/app/router.dart';
import 'package:flutterwidgets/app/style/TolyIcon.dart';

import 'package:flutterwidgets/blocs/widgets/home_bloc.dart';
import 'package:flutterwidgets/blocs/widgets/home_state.dart';
import 'package:toast/toast.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      elevation: 3,
      child: _buildChild(context),
    );
  }

  Widget _buildChild(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Container(
        color: state.homeColor.withAlpha(33), //顶部appbar标签的颜色
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _buildDrawerHeader(state.homeColor),
            ListTile(
              leading: Icon(
                TolyIcon.icon_them,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
              trailing: _nextIcon(context),
              title: Text('我的主题'),
              onTap: () {
                Navigator.of(context).pushNamed(Router.setting);
              },
            ),
            ListTile(
              leading: Icon(
                TolyIcon.icon_star,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
              title: Text('我的收藏'),
              trailing: _nextIcon(context),
              onTap: () {
                Navigator.of(context).pushNamed(Router.collect);
              },
            ),
            Divider(
              height: 1,
            ),
            _buildFlutterUnit(context),
            ListTile(
              leading: Icon(
                TolyIcon.icon_code,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
              title: Text('Dart手册'),
              trailing: _nextIcon(context),
              onTap: () {
                  Toast.show("功能暂未完成", context);
              },
            ),
            Divider(
              height: 1,
            ),
            ListTile(
              leading: Icon(
                TolyIcon.icon_layout,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
              title: Text('数据统计'),
              trailing: _nextIcon(context),
              onTap: () {
                Toast.show("功能暂未完成", context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
              title: Text('关于应用'),
              trailing: _nextIcon(context),
              onTap: () {
                Navigator.of(context).pushNamed(Router.about_app);
              },
            ),
            ListTile(
              leading: Icon(
                TolyIcon.icon_kafei,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
              title: Text('联系本人'),
              trailing: _nextIcon(context),
              onTap: () {
                Navigator.of(context).pushNamed(Router.about_me);
              },
            ),
          ],
        ),
      );
    });
  }

  Widget _buildDrawerHeader(Color color) {
    return DrawerHeader(
      padding: EdgeInsets.only(top: 10, left: 15),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/drawer_head.jpg'),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              FlutterLogo(
                colors: Colors.orange,
                size: 34,
              ),
              Text(
                "Flutter HEAD",
                style: TextStyle(fontSize: 24, color: Colors.white, shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(1, 1),
                    blurRadius: 3,
                  )
                ]),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'The Unity Of Flutter, The Unity Of Coder.',
            style: TextStyle(fontSize: 15, color: Colors.white, shadows: [
              Shadow(color: color, offset: Offset(.5, .5), blurRadius: 1)
            ]),
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            children: <Widget>[
              Spacer(
                flex: 5,
              ),
              Text(
                '—— 小官在江湖',
                style: TextStyle(fontSize: 15, color: Colors.white, shadows: [
                  Shadow(
                      color: Colors.orangeAccent,
                      offset: Offset(.5, .5),
                      blurRadius: 1)
                ]),
              ),
              Spacer(
                //Spacer创建一个可调整的空间隔，可用于调整Flex容器（如行或列）中窗口小部件之间的间距。它其实就是包装了一个 Expanded 的 SizedBox 。
                flex: 1,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _nextIcon(BuildContext context) =>
      Icon(Icons.chevron_right, color: Theme
          .of(context)
          .primaryColor);

  Widget _buildFlutterUnit(BuildContext context) {
    return ExpansionTile(
      title: Text("Flutter 集录"),
      leading: Icon(
        Icons.extension,
        color: Theme
            .of(context)
            .primaryColor,
      ),
      children: <Widget>[
        ListTile(
          leading: Icon(TolyIcon.icon_tag, color: Theme
              .of(context)
              .primaryColor),
          title: Text("属性集录"),
          trailing: _nextIcon(context),
          onTap: () {
            Navigator.of(context).pushNamed(Router.attr);
          },
        ),
        ListTile(
          leading: Icon(Icons.palette, color: Theme
              .of(context)
              .primaryColor),
          title: Text("绘画集录"),
          trailing: _nextIcon(context),
          onTap: () {
            Navigator.of(context).pushNamed(Router.paint);
          },
        ),
        ListTile(
          leading: Icon(Icons.widgets, color: Theme
              .of(context)
              .primaryColor),
          title: Text("布局集录"),
          trailing: _nextIcon(context),
          onTap: () {
            Navigator.of(context).pushNamed(Router.layout);
          },
        ),
        ListTile(
          leading: Icon(TolyIcon.icon_bug, color: Theme
              .of(context)
              .primaryColor),
          title: Text("bug/feature集录"),
          trailing: _nextIcon(context),
          onTap: () {
            Navigator.of(context).pushNamed(Router.bug);
          },
        ),

      ],
    ); //ExpansionTile就是一个可以展开闭合的组件
  }
}
