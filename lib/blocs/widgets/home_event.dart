import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutterwidgets/app/enums.dart';


/// create by 小官在江湖 on 2020-03-03
/// contact me by email 1981462002@qq.com
/// 说明: 

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class EventTabTap extends HomeEvent {
  final WidgetFamily family;

  EventTabTap(this.family);

}


