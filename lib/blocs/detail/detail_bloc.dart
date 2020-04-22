import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterwidgets/model/widget_model.dart';
import 'package:flutterwidgets/repositorys/widget_db_repository.dart';
import 'package:flutterwidgets/repositorys/widget_repository.dart';

import 'detail_event.dart';
import 'detail_state.dart';

/// create by 张风捷特烈 on 2020-03-03
/// contact me by email 1981462002@qq.com
/// 说明:
class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final WidgetDbRepository repository;

  DetailBloc({@required this.repository});

  @override
  DetailState get initialState => DetailEmpty();

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if (event is FetchWidgetDetail) {
      yield* _mapLoadWidgetToState(event.widgetModel);
    }
  }

  Stream<DetailState> _mapLoadWidgetToState(
      WidgetModel widgetModel) async* {
    try {
      final nodes = await this.repository.loadNode(widgetModel);
      final links = await this.repository.loadWidget(widgetModel.links);
      print("获取控件链接"+"${links.toString()}");
      yield DetailWithData(
          widgetModel: widgetModel, nodes: nodes,links: links);
    } catch (_) {
      yield DetailFailed();
    }
  }
}
