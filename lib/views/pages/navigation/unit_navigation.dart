import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterwidgets/app/res/cons.dart';
import 'package:flutterwidgets/app/router.dart';
import 'package:flutterwidgets/blocs/collect/collect_bloc.dart';
import 'package:flutterwidgets/blocs/collect/collect_event.dart';
import 'package:flutterwidgets/blocs/widgets/home_bloc.dart';
import 'package:flutterwidgets/blocs/widgets/home_state.dart';
import 'package:flutterwidgets/views/pages/home/home_page.dart';
import 'package:flutterwidgets/views/pages/navigation/unit_bottom_bar.dart';
import 'package:flutterwidgets/views/pages/settings/home_drawer.dart';

import '../collect_page.dart';

class UnitNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UnitNavigationState();
  }
}

class _UnitNavigationState extends State<UnitNavigation> {
  PageController _controller; //页面控制器，初始0

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: state.homeColor,
          child: Icon(Icons.search),
          onPressed: () async {
            final result = await Navigator.of(context).pushNamed(Router.search);
            print("回调结果" + "${result.toString()}");
          },
        ),
        //centerDocked 底部中间
        //endDocked 底部右侧
        //centerFloat 中间偏上
        //endFloat 底部偏上
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          //使用PageView实现页面的切换
          controller: _controller,
          //使用TabBar或者BottomNavigationBar的时候，都会配合使用 TabBarView和PageView
          children: <Widget>[HomePage(), CollectPage()],
        ),
        bottomNavigationBar: UnitBottomBar(
          color: state.homeColor,
          itemData: Cons.ICONS_MAP,
          onItemClick: _onTapNav,
        ),
        drawer: HomeDrawer(),
        endDrawer: HomeDrawer(),
      );
    });
  }

  _onTapNav(int index) {
    _controller.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.linear);
    if (index == 1) {
      BlocProvider.of<CollectBloc>(context)
          .add(EventSetCollectData()); //通过用之前在main.dart创造好的，这里直接获取使用CollectBloc
    }
  }
}
