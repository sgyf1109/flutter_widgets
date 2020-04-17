import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
//java中
//1）对于==，如果作用于基本数据类型的变量，则直接比较其存储的 “值”是否相等；
//
//　　　　如果作用于引用类型的变量，则比较的是所指向的对象的地址
//
//　　2）对于equals方法，注意：equals方法不能作用于基本数据类型的变量
//
//　　　　如果没有对equals方法进行重写，则比较的是引用类型的变量所指向的对象的地址；
//
//　　　　诸如String、Date等类对equals方法进行了重写的话，比较的是所指向的对象的内容。
abstract class GlobalEvent extends Equatable{//Equatable一个有助于实现相等性的抽象类，而无需显式重写==和hashCode。
    const GlobalEvent();
    @override
  // TODO: implement props
  List<Object> get props => [];
}

class EventInitApp extends GlobalEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class EventSwitchFontFamily extends GlobalEvent {
  final String family;
  const EventSwitchFontFamily(this.family);

  @override
  List<Object> get props => [family];
}

class EventSwitchThemeColor extends GlobalEvent {
  final MaterialColor color;

  const EventSwitchThemeColor(this.color);

  @override
  List<Object> get props => [color];
}

class EventSwitchCoderTheme extends GlobalEvent {
  final int codeStyleIndex;

  const EventSwitchCoderTheme(this.codeStyleIndex);

  @override
  List<Object> get props => [codeStyleIndex];
}

class EventSwitchShowBg extends GlobalEvent {
  final bool show;

  const EventSwitchShowBg(this.show);

  @override
  List<Object> get props => [show];
}

class EventChangeItemStyle extends GlobalEvent {
  final int index;

  const EventChangeItemStyle(this.index);

  @override
  List<Object> get props => [index];
}


