import 'package:equatable/equatable.dart';
import 'package:flutterwidgets/model/widget_model.dart';


/// create by 小官在江湖 on 2020-03-03
/// contact me by email 1981462002@qq.com
/// 说明: 详情事件

abstract class DetailEvent extends Equatable {
  const DetailEvent();
  @override
  List<Object> get props => [];
}


class FetchWidgetDetail extends DetailEvent {
  final WidgetModel widgetModel;

  const FetchWidgetDetail(this.widgetModel);

  @override
  List<Object> get props => [widgetModel];

  @override
  String toString() {
    return 'SeeWidgetDetail{widgetModel: $widgetModel}';
  }
}
