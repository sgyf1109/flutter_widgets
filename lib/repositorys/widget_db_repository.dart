

import 'package:flutterwidgets/app/enums.dart';
import 'package:flutterwidgets/model/node_model.dart';
import 'package:flutterwidgets/model/widget_model.dart';
import 'package:flutterwidgets/repositorys/widget_repository.dart';
import 'package:flutterwidgets/storage/app_storeage.dart';
import 'package:flutterwidgets/storage/node_dao.dart';
import 'package:flutterwidgets/storage/po/widget_po.dart';
import 'package:flutterwidgets/storage/widget_dao.dart';

class WidgetDbRepository implements WidgetRepository {
  final Appstorage storage;

  WidgetDao _widgetDao;
  NodeDao _nodeDao;


  WidgetDbRepository(this.storage){
    _widgetDao = WidgetDao(storage);
    _nodeDao = NodeDao(storage);
  }

  @override
  Future<List<WidgetModel>> loadWidgets(WidgetFamily family) async {

    var data = await _widgetDao.queryByFamily(family);
    var widgets = data.map((e) => WidgetPo.fromJson(e)).toList();
    return widgets.map(WidgetModel.fromPo).toList();
  }

  @override
  Future<List<WidgetModel>> loadCollectWidgets() async {
    var data = await _widgetDao.queryCollect();
    var widgets = data.map((e) => WidgetPo.fromJson(e)).toList();
    var list = widgets.map(WidgetModel.fromPo).toList();
    return list;
  }

  @override
  Future<List<WidgetModel>> searchWidgets(SearchArgs args) async {
    var data = await _widgetDao.search(args);
    var widgets = data.map((e) => WidgetPo.fromJson(e)).toList();
    return widgets.map(WidgetModel.fromPo).toList();
  }

  @override
  Future<List<NodeModel>> loadNode(WidgetModel widgetModel) async{
    var data = await _nodeDao.queryById(widgetModel.id);
    var nodes = data.map((e) => NodeModel.fromJson(e)).toList();
    return nodes;
  }

  @override
  Future<List<WidgetModel>> loadWidget(List<int> id) async{
    var data = await _widgetDao.queryByIds(id);
    var widgets = data.map((e) => WidgetPo.fromJson(e)).toList();
    if(widgets.length>0) return widgets.map(WidgetModel.fromPo).toList();
    return null;
  }

  @override
  Future<void> toggleCollect(int id,) {
    return _widgetDao.toggleCollect(id);
  }
}
