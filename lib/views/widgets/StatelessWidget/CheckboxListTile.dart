import 'package:flutter/material.dart';


class CustomCheckBoxListTile extends StatefulWidget {
  @override
  _CustomCheckBoxListTileState createState() => _CustomCheckBoxListTileState();
}

class _CustomCheckBoxListTileState extends State<CustomCheckBoxListTile> {
  var _selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.grey.withAlpha(22),
      child: CheckboxListTile(
        value: _selected,
        checkColor: Colors.yellow,
        activeColor: Colors.orangeAccent,
        secondary: Image.asset("assets/images/icon_head.png"),
        title: Text("小官在江湖"),
        subtitle: Text("@万花过尽知无物"),
        onChanged: (v) => setState(() => _selected = !_selected),
      ),
    );
  }
}

class SelectCheckBoxListTile extends StatefulWidget {
  @override
  _SelectCheckBoxListTileState createState() => _SelectCheckBoxListTileState();
}

class _SelectCheckBoxListTileState extends State<SelectCheckBoxListTile> {
  var _selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.grey.withAlpha(22),
      child: CheckboxListTile(
        value: _selected,
        selected: _selected,
        checkColor: Colors.yellow,
        activeColor: Colors.orangeAccent,
        secondary: Image.asset("assets/images/icon_head.png"),
        title: Text("小官在江湖"),
        subtitle: Text("@万花过尽知无物"),
        onChanged: (v) => setState(() => _selected = !_selected),
      ),
    );
  }
}

class DenseCheckBoxListTile extends StatefulWidget {
  @override
  _DenseCheckBoxListTileState createState() => _DenseCheckBoxListTileState();
}

class _DenseCheckBoxListTileState extends State<DenseCheckBoxListTile> {
  var _selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.grey.withAlpha(22),
      child: CheckboxListTile(
        value: _selected,
        dense: _selected,
        checkColor: Colors.yellow,
        activeColor: Colors.orangeAccent,
        secondary: Image.asset("assets/images/icon_head.png"),
        title: Text("小官在江湖"),
        subtitle: Text("@万花过尽知无物"),
        onChanged: (v) => setState(() => _selected = !_selected),
      ),
    );
  }
}