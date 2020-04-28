import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterwidgets/app/router.dart';
import 'package:flutterwidgets/app/style/TolyIcon.dart';
import 'package:flutterwidgets/blocs/detail/detail_bloc.dart';
import 'package:flutterwidgets/blocs/detail/detail_event.dart';
import 'package:flutterwidgets/blocs/search/search_bloc.dart';
import 'package:flutterwidgets/blocs/search/search_event.dart';
import 'package:flutterwidgets/blocs/search/search_state.dart';
import 'package:flutterwidgets/compoents/permanent/circle.dart';
import 'package:flutterwidgets/model/widget_model.dart';
import 'package:flutterwidgets/storage/widget_dao.dart';
import 'package:flutterwidgets/views/items/techno_widget_list_item.dart';
import 'package:flutterwidgets/views/pages/search/app_search_bar.dart';
import 'package:flutterwidgets/views/pages/search/error_page.dart';
import 'package:flutterwidgets/views/pages/search/loading_page.dart';
import 'package:flutterwidgets/views/pages/search/start_filter.dart';

import 'empty_page.dart';
import 'not_search_page.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: WillPopScope(
          child: CustomScrollView(
            //自定义滑动 View，可以包含多个元素，SingleChildScrollView只能包含一个
            slivers: <Widget>[
              _buildSliverAppBar(),
              SliverToBoxAdapter(
                //如果想要在滚动视图中添加一个普通的控件，那么就可以使用 SliverToBoxAdapter 来将各种视图组合在一起
                child: _buildStarFilter(),
              ),
              BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
                return _buildBodyByState(state);
              })
            ],
          ),
          onWillPop: () async {
            //不加async可以直接返回Future.value(true); 表示退出.
            BlocProvider.of<SearchBloc>(context)
                .add(EventTextChanged(args: SearchArgs()));
            return true;
          }), //双击返回与界面退出提示
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      pinned: true, //是否悬浮,pinned 和 floating 属性不可以同时为 true
      title: AppSearchBar(),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Icon(TolyIcon.icon_sound),
        ),
      ],
    );
  }

  Widget _buildStarFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10, left: 10, bottom: 5),
          child: Wrap(
            spacing: 5,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Circle(
                radius: 5,
                color: Colors.orange,
              ),
              Text(
                "星级查询",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        MultiChipFilter<int>(
          data: [1, 2, 3, 4, 5],
          avatarBuilder: _avatarBuilder, //回调时已经传过参数
          labelBuilder: (_, index) => Icon(
            Icons.star,
            color: index ? Colors.blue : Colors.grey,
            size: 18,
          ),
          onChange: _doSelectStart, //引用方法后面不能带括号
        ),
        Divider()
      ],
    );
  }

  _doSelectStart(List<int> select) {
    //选中的下标集合
    var temp = select.map((e) => e + 1).toList();
    if (temp.length < 5) {
      //没有全选
      print("未全选" + "${temp.toString()}");
      temp.addAll(List.generate(5 - temp.length, (e) {
        return -1;
      })); //保证stars数组为5个，未选中的生成-1[1,2，-1，-1，-1]
      BlocProvider.of<SearchBloc>(context)
          .add(EventTextChanged(args: SearchArgs(name: '', stars: temp)));
    }
  }

  Widget _avatarBuilder(BuildContext context, int index) {
    return CircleAvatar(
      child: Text((index + 1).toString()),
    );
  }

  Widget _buildBodyByState(SearchState state) {
    print("搜索状态" + "${state.toString()}");
    if (state is SearchStateNoSearch) {
      return SliverToBoxAdapter(child: NotSearchPage());
    }
    if (state is SearchStateEmpty) {
      return SliverToBoxAdapter(child: EmptyPage());
    }
    if (state is SearchStateLoading) {
      return SliverToBoxAdapter(child: LoadingPage());
    }
    if (state is SearchStateError) {
      return SliverToBoxAdapter(child: ErrorPage());
    }
    if (state is SearchStateSuccess) {
      return _buildSliverList(state.result);
    }
    return SliverToBoxAdapter(child: NotSearchPage());
  }

  Widget _buildSliverList(List<WidgetModel> models) {
//    SliverChildListDelegate 一般用来构 item 不多的列表，效率更低。
//    SliverChildBuilderDelegate 一般用来构 item 更多的列表，效率更高。
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        //SliverGrid有delegate和gridDelegate两种参数
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: InkWell(
            onTap: () {
              BlocProvider.of<DetailBloc>(context).add(FetchWidgetDetail(models[index]));
//    BlocProvider.of<CollectBloc>(context).add(EventSetCollect(collect:model.collected));
              Navigator.pushNamed(context, Router.widget_detail);
            },
            //InkWell水波纹效果
            child: TechnoWidgetListItem(
              data: models[index],
            ),
          ),
        );
      }, childCount: models.length),
    );
  }
}
