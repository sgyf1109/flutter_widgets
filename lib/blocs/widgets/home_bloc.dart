import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterwidgets/app/enums.dart';
import 'package:flutterwidgets/app/res/cons.dart';
import 'package:flutterwidgets/repositorys/widget_db_repository.dart';
import 'package:flutterwidgets/repositorys/widget_repository.dart';

import 'home_event.dart';
import 'home_state.dart';

/// create by 张风捷特烈 on 2020-03-03
/// contact me by email 1981462002@qq.com
/// 说明:

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WidgetDbRepository repository;

  HomeBloc({@required this.repository});

  @override
  HomeState get initialState => WidgetsLoading(
      homeColor: Color(Cons.tabColors[0]));

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is EventTabTap) {//控件类型WidgetFamily.statelessWidget等
      yield* _mapLoadWidgetToState(event.family);
    }
  }

  Stream<HomeState> _mapLoadWidgetToState(WidgetFamily family) async* {
    try {
      final widgets = await this.repository.loadWidgets(family);
      yield WidgetsLoaded(
          widgets: widgets,
          homeColor: Color(Cons.tabColors[family.index]));
    } catch (err) {
      print(err);
      yield WidgetsLoadFailed();
    }
  }
}
