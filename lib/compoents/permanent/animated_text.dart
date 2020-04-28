import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  final int delayInMilliseconds;
  final int durationInMilliseconds;
  final TextStyle textStyle;

  AnimatedText(this.text, this.delayInMilliseconds,
      {this.durationInMilliseconds: 2500, this.textStyle});

  @override createState() =>  AnimatedTextState();
}

class AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {

  String currentText = '';

  AnimationController _controller;

  //String 类 有一些属性可以提取 rune 信息
  List<int> get  textRunes=> widget.text.runes.toList();//runes是UTF-32 代码点（code points）的字符串。 用于在字符串中表示 Unicode 字符。
  int get value => _controller.value.toInt();

  int curIndex = 0;


  @override
  void initState()  {
    super.initState();

  /*  Runes input = new Runes(
        '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
    print(new String.fromCharCodes(input));*/

    currentText = String.fromCharCode(textRunes[0]);

    _controller =  AnimationController(
        vsync: this,
        value: 0.0,
        lowerBound: 0.0,//动画最小边界值且这个值小于 upperBound 的值，如果动画变化值小于这个值则为取消动画，不能为 null 。
        upperBound: textRunes.length.toDouble(),//动画最大边界值且比 lowerBound 大，如果动画变化值大于这个值则动画状态为完成状态。不能为 null 。
        duration:  Duration(milliseconds: widget.durationInMilliseconds));

    _controller..addListener(_updateText)..forward();

  }

  _updateText(){
    if (value > curIndex && value < textRunes.length) {
      setState(() {
        curIndex = value;
        currentText +=  String.fromCharCode(textRunes[curIndex]);
        print("动画字符========="+"${currentText}"+"===="+"${value}"+"====="+"${textRunes[curIndex]}");
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Text(currentText, textAlign: TextAlign.left,
      style: widget.textStyle ??
           TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),);
  }
}