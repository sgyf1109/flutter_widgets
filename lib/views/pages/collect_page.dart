import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterwidgets/app/router.dart';
import 'package:flutterwidgets/blocs/collect/collect_bloc.dart';
import 'package:flutterwidgets/blocs/collect/collect_event.dart';
import 'package:flutterwidgets/blocs/collect/collect_state.dart';
import 'package:flutterwidgets/blocs/detail/detail_bloc.dart';
import 'package:flutterwidgets/blocs/detail/detail_event.dart';
import 'package:flutterwidgets/model/widget_model.dart';
import 'package:flutterwidgets/views/items/collect_widget_list_item.dart';

class CollectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CollectPageState();
  }
}

class _CollectPageState extends State<CollectPage> {
  final gridDelegate = new SliverGridDelegateWithFixedCrossAxisCount(//根据给的 maxCrossAxisExtent 最大宽度自动分配一列展示多少个
    crossAxisCount: 2,//item高度
    mainAxisSpacing: 10.0, //主轴中间间距
    crossAxisSpacing: 10.0, //副轴中间间距
    childAspectRatio: 2.0, //item 宽高比
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(" 收藏集"),
      ),
      body: BlocBuilder<CollectBloc, CollectState>(builder: (context, state) {
        return GridView.builder(
            gridDelegate: gridDelegate, itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
                BlocProvider.of<DetailBloc>(context).add(FetchWidgetDetail(state.widgets[index]));//main中定义好的DetailBloc
                Navigator.pushNamed(context, Router.widget_detail);
            },
            child:CollectWidgetListItem(
              data: state.widgets[index],
              onDelectItemClick: (model){
                  return _deleteCollect(model);
              },
            ) ,
          );
        }, itemCount: state.widgets.length, padding: EdgeInsets.all(10));
      }),
    );
  }

  Widget _deleteCollect(WidgetModel model) {
    BlocProvider.of<CollectBloc>(context)
        .add(ToggleCollectEvent(id: model.id));//收藏状态如果是0就变为1,1就变为0
  }
}