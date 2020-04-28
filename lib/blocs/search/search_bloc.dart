

import 'package:flutter/material.dart';
import 'package:flutterwidgets/repositorys/widget_db_repository.dart';
import 'package:flutterwidgets/repositorys/widget_repository.dart';

import 'search_event.dart';
import 'search_state.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final WidgetDbRepository repository;

  SearchBloc({@required this.repository});
  @override
  SearchState get initialState => SearchStateNoSearch();//初始状态


  @override
  Stream<SearchState> transformEvents(
      Stream<SearchEvent> events,
      Stream<SearchState> Function(SearchEvent event) next,) {
    return super.transformEvents(events
        .debounceTime(Duration(milliseconds: 500),),
      next,
    );
  }

  @override
  Stream<SearchState> mapEventToState(SearchEvent event,) async* {
    if (event is EventTextChanged) {
      print("星集合"+"${event.args.stars.toString()}");
      if (event.args.name.isEmpty&&event.args.stars.every((e)=>e==-1)) {//every全部元素
        yield SearchStateNoSearch();
      } else {
        yield SearchStateLoading();
        try {
          final results = await repository.searchWidgets(event.args);
           yield results.length==0?SearchStateEmpty():SearchStateSuccess(results);
          print('mapEventToState');
        } catch (error) {
          print("错误信息"+error);
          yield  SearchStateError();
        }
      }
    }
  }
}