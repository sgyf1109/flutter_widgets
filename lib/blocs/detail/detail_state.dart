import 'package:equatable/equatable.dart';
import 'package:flutterwidgets/model/node_model.dart';
import 'package:flutterwidgets/model/widget_model.dart';


/// create by 小官在江湖 on 2020-03-03
/// contact me by email 1981462002@qq.com
/// 说明: 详情状态类

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailWithData extends DetailState {
  final WidgetModel widgetModel;
  final List<WidgetModel> links;
  final List<NodeModel> nodes;

  const DetailWithData({this.widgetModel, this.nodes,this.links});

  @override
  List<Object> get props => [widgetModel,nodes];

  @override
  String toString() {
    return 'DetailWithData{widget: $widgetModel, nodes: $nodes}';
  }

}

class DetailEmpty extends DetailState {}
class DetailFailed extends DetailState {}