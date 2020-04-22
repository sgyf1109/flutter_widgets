

import 'package:equatable/equatable.dart';
import 'package:flutter/painting.dart';
import 'package:flutterwidgets/app/convert.dart';
import 'package:flutterwidgets/app/enums.dart';
import 'package:flutterwidgets/app/res/cons.dart';
import 'package:flutterwidgets/storage/po/widget_po.dart';

enum WidgetType {
  singe_show, //单一展示型 0
  structure, //结构型 1
  shape, //可形变 2
  event, //事件型 3
  ability, //功能型 4
  layout, //布局型 5
  scroll, //滚动型
}

class WidgetModel extends Equatable {
  final int id;
  final String name;
  final String nameCN;
  final WidgetFamily family;
  final bool collected;
  final WidgetType type;
  final List<int> links;//关联的组件标号
  final double lever;
  final ImageProvider image;
  final String info;

  Color get color => Color(Cons.tabColors[family.index]);

  const WidgetModel(
      {this.id,
      this.name,
      this.nameCN,
      this.family,
      this.collected,
        this.links,
      this.type,
      this.lever,
      this.image,
      this.info});

  @override
  List<Object> get props => [id];

  static WidgetModel fromPo(WidgetPo po) {
    return WidgetModel(
      id: po.id,
      name: po.name,
      nameCN: po.nameCN,
      family: Convert.toFamily(po.family),
      image: convertImage(po.image),
      lever: po.lever,
      collected: po.collected == 1,
      info: po.info,
      links: formatLinkTo(po.linkWidget),
    );
  }

  static convertImage(String image) {
    return image.isEmpty ? null : AssetImage(image);
  }

  @override
  String toString() {
    return 'WidgetModel{id: $id, name: $name,collected: $collected}';
  }

  static List<int> formatLinkTo(String links) {
    if(links.isEmpty){
      return [];
    }
    if(!links.contains(',')){
      return [int.parse(links)];
    }
    return links.split(',').map<int>((e)=>int.parse(e)).toList();
  }


}
