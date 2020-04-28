import 'package:flutter/material.dart';


/// create by 张风捷特烈 on 2020-04-07
/// contact me by email 1981462002@qq.com
/// 说明: 

typedef BoolWidgetBuilder = Widget Function(BuildContext context, bool selected);

class MultiChipFilter<T> extends StatefulWidget {
  final List<T> data;
  final BoolWidgetBuilder labelBuilder;
  final IndexedWidgetBuilder avatarBuilder;//默认IndexedWidgetBuilder= Widget Function(BuildContext context, bool selected)
  final Function(List<int>) onChange;

  MultiChipFilter({@required this.data,@required this.labelBuilder,this.avatarBuilder,@required this.onChange});

  @override
  _MultiChipFilterState createState() => _MultiChipFilterState();
}

class _MultiChipFilterState<T> extends State<MultiChipFilter<T>> {
  List<int> _selected = <int>[];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.data.map((e) =>
          _buildChild(context,widget.data.indexOf(e))).toList(),
    );
  }

  Widget _buildChild(BuildContext context,int index) {
    bool selected = _selected.contains(index);
    return FilterChip(//自带的比ChoiceChip多一个选中的勾勾的效果
      selectedColor: Colors.orange.withAlpha(55),
      labelPadding: EdgeInsets.only(left: 5,right: 5),
      selectedShadowColor: Colors.blue,
      shadowColor: Colors.orangeAccent,
      pressElevation: 5,
      elevation: 3,
      avatar: widget.avatarBuilder==null?null:widget.avatarBuilder(context,index),//数字
      label: widget.labelBuilder(context,selected),
      selected: selected,
      onSelected: (bool value) {
        setState(() {
          if (value) {
            _selected.add(index);
          } else {
            _selected.removeWhere((i) => i == index);//删除指定条件的元素，成功返回null
          }
          if(widget.onChange!=null) widget.onChange(_selected);
        });
      },
    );
  }
}





