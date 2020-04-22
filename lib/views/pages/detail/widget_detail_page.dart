import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_star/flutter_star.dart';
import 'package:flutterwidgets/app/style/TolyIcon.dart';
import 'package:flutterwidgets/app/utils/Toast.dart';
import 'package:flutterwidgets/blocs/collect/collect_bloc.dart';
import 'package:flutterwidgets/blocs/collect/collect_event.dart';
import 'package:flutterwidgets/blocs/collect/collect_state.dart';
import 'package:flutterwidgets/blocs/detail/detail_bloc.dart';
import 'package:flutterwidgets/blocs/detail/detail_event.dart';
import 'package:flutterwidgets/blocs/detail/detail_state.dart';
import 'package:flutterwidgets/compoents/permanent/feedback_widget.dart';
import 'package:flutterwidgets/compoents/permanent/panel.dart';
import 'package:flutterwidgets/model/widget_model.dart';

class WidgetDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WidgetDetailPageState();
  }
}

class _WidgetDetailPageState extends State<WidgetDetailPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
      if (state is DetailWithData) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.widgetModel.name),
            actions: <Widget>[
              _buildCollectButton(state.widgetModel),
            ],
          ),
          body: SingleChildScrollView(
            //通常SingleChildScrollView只应在期望的内容不会超过屏幕太多时使用，这是因为SingleChildScrollView不支持基于Sliver的延迟实例化模式
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      _buildLeft(state.widgetModel),
                      _buildRight(state.widgetModel)
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 5),
                        child: Icon(
                          Icons.link,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        "相关组件",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                  _buildLinkTo(context, state.links)
                ],
              ),
            ),
          ),
        );
      }
      return Container();
    });
  }

  Widget _buildCollectButton(WidgetModel model) {
    //监听 CollectBloc 伺机弹出toast
    return BlocListener<CollectBloc, CollectState>(
      //BlocListener它应该用于每个状态变化会触发一次的功能,比如导航栏、显示一个SnackBar、显示一个Dialog等等。
      listener: (context, state) {
        bool collected = state.widgets.contains(model);
        Toast.toast(context,
            collected ? "收藏【${model.name}】组件成功!" : "已取消【${model.name}】组件收藏!");
      },
      child: FeedbackWidget(child:
          BlocBuilder<CollectBloc, CollectState>(builder: (context, state) {
        //BlocBuilder实时响应
        return Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              state.widgets.contains(model)
                  ? TolyIcon.icon_star_ok
                  : TolyIcon.icon_star_add,
              size: 25,
            ));
      }), onPressed: () {
        return BlocProvider.of<CollectBloc>(context)
            .add(ToggleCollectEvent(id: model.id));
      }),
    );
  }

  Widget _buildLeft(WidgetModel model) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              model.nameCN,
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff1EBBFD),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Panel(
              child: Text(model.info),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRight(WidgetModel model) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
                tag: "hero_widget_image_${model.name}",
                child: ClipRRect(
                    //ClipRRect组件可以对子组件进行圆角裁剪
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: model.image == null
                        ? Image.asset('assets/images/caver.jpeg')
                        : Image(image: model.image))),
          ),
        ),
        StarScore(
          score: model.lever,
          star: Star(size: 15, fillColor: Colors.blue),
        )
      ],
    );
  }

  Widget _buildLinkTo(BuildContext context, List<WidgetModel> links) {
    if (links == null || links.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(left: 10),
        child: Chip(
          label: Text("暂无链接组件"),
          backgroundColor: Colors.grey.withAlpha(120),
          labelStyle: TextStyle(fontSize: 12, color: Colors.white),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(left: 10, top: 10),
        child: Wrap(
          spacing: 5,
          children: <Widget>[
            ...links.map((e) {
              return ActionChip(
                label: Text("${e.name}"),
                onPressed: () {
                  BlocProvider.of<DetailBloc>(context)
                      .add(FetchWidgetDetail(e));//直接刷新当前页面
                },
                elevation: 2,
                shadowColor: Colors.orange,
                backgroundColor: Theme.of(context).primaryColor,
                labelStyle: TextStyle(fontSize: 12, color: Colors.white),
              );
            })
          ],
        ),
      );
    }
  }
}
