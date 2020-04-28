import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterwidgets/app/convert.dart';
import 'package:flutterwidgets/app/router.dart';
import 'package:flutterwidgets/blocs/detail/detail_bloc.dart';
import 'package:flutterwidgets/blocs/detail/detail_event.dart';
import 'package:flutterwidgets/blocs/global/global_bloc.dart';
import 'package:flutterwidgets/blocs/widgets/home_bloc.dart';
import 'package:flutterwidgets/blocs/widgets/home_event.dart';
import 'package:flutterwidgets/blocs/widgets/home_state.dart';
import 'package:flutterwidgets/model/widget_model.dart';
import 'package:flutterwidgets/views/items/coupon_widget_list_item.dart';
import 'package:flutterwidgets/views/items/techno_widget_list_item.dart';
import 'package:flutterwidgets/views/pages/common/empty_page.dart';
import 'package:flutterwidgets/views/pages/home/background.dart';
import 'package:flutterwidgets/views/pages/home/toly_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double _height = kToolbarHeight * 2 -
      20; //kToolbarHeight 是 The height of the toolbar component of the [AppBar].
  ScrollController _ctrl;
  double _limitY = 35;

  @override
  void initState() {
    _ctrl = ScrollController()..addListener(_updateAppBarHeight);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("appbar高度" + "${_height}");
    return Scaffold(
      appBar: TolyAppBar(
        preferredSize: Size.fromHeight(_height),
        //PreferredSize一般用来设置Appbar的高度属性
        onItemClick: _switchTab,
      ),
      body: Stack(
        children: <Widget>[
          if (BlocProvider.of<GlobalBloc>(context).state.showBackGround)
            Background(),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return _buildContent(state);
            },
          )
        ],
      ),
    );
  }

  _updateAppBarHeight() {
    if (_ctrl.offset < _limitY * 4) {
      setState(() {
        _height = kToolbarHeight * 2 - 20 - _ctrl.offset / 4;
      });
    }
  }

  _switchTab(int index, Color color) {
    if (_ctrl.hasClients)
      _ctrl.jumpTo(0); //针对No element错误，只需判断一下_positions是不是空的就行了，即hasClients。
    BlocProvider.of<HomeBloc>(context)
        .add(EventTabTap(Convert.toFamily(index)));
  }

  Widget _buildContent(HomeState state) {
    if (state is WidgetsLoaded) {
      var items = state.widgets;
      if (items.isEmpty) {
        return EmptyPage();
      }
      return ListView.builder(
        controller: _ctrl,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: GestureDetector(
                onTap: (){
                  return _toDetailPage(items[index]);
                },
                child: _mapItemByType(items[index]),
              ),
            );
          },
          itemCount: items.length);
    }
    return Container();
  }

  Widget _mapItemByType(WidgetModel model) {
    var index = BlocProvider.of<GlobalBloc>(context).state.itemStyleIndex;//item样式
    switch(index){
      case 0:
        return TechnoWidgetListItem(
          data: model,
        );
      case 1:
        return CouponWidgetListItem(
          data: model,
        );
      case 2:
        return CouponWidgetListItem(
          hasTopHole:false,
          data: model,
        );
      case 3:
        return CouponWidgetListItem(
          hasTopHole:true,hasBottomHole:true,
          data: model,
        );
    }
    return TechnoWidgetListItem(
      data: model,
    );
  }

  Widget _toDetailPage(WidgetModel model) {
    BlocProvider.of<DetailBloc>(context).add(FetchWidgetDetail(model));//main中定义好的DetailBloc
    Navigator.pushNamed(context, Router.widget_detail);
  }
}
