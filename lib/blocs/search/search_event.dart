


import 'package:flutterwidgets/storage/widget_dao.dart';

abstract class SearchEvent{//事件基
  const SearchEvent();
}

class EventTextChanged extends SearchEvent {
  final SearchArgs args;//参数
  const EventTextChanged({this.args});
}
