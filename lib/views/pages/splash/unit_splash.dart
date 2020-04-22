import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterwidgets/app/router.dart';
import 'package:flutterwidgets/views/pages/splash/unit_paint.dart';

class UnitSplash extends StatefulWidget {
  final double size;
  UnitSplash({this.size = 200});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UnitSplashState();
  }
}

class _UnitSplashState extends State<UnitSplash> with TickerProviderStateMixin {//TickerProviderStateMixin适用于多AnimationController的情况。
  AnimationController _controller;
  AnimationController _secondController;
  double _factor;
  Animation _curveAnim;
  bool _animEnd = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle); //设置沉浸式状态栏
    _controller =
        AnimationController(duration: Duration(milliseconds: 1000), vsync: this)
          ..addListener(() => setState(() {
                return _factor = _curveAnim.value;
              }))
          ..addStatusListener((s) {
            if (s == AnimationStatus.completed) {
              setState(() {
                _animEnd = true;
                _secondController.forward();//底部文字动画
              });
            }
          });
    _secondController =
    AnimationController(duration: Duration(milliseconds: 600), vsync: this)
      ..addListener(() => setState(() {

      }))
      ..addStatusListener((s) {
        if (s == AnimationStatus.completed) {
          Navigator.of(context).pushReplacementNamed(Router.nav);
        }
      });
    _curveAnim = CurvedAnimation(
        parent: _controller,
        curve: Curves
            .fastOutSlowIn); //CurvedAnimation曲线动画，第二个参数是 Curve 对象，表示动画曲线函数，类似 Android 动画的插值器。有一些内置曲线
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var winH = MediaQuery.of(context)
        .size
        .height; //size逻辑像素，并不是物理像素，类似于Android中的dp，逻辑像素会在不同大小的手机上显示的大小基本一样，物理像素 = size*devicePixelRatio。
    var winW = MediaQuery.of(context).size.width;
    print("参数值变化"+"${_factor}"+"${winW}"+"${winH}");
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildLogo(Colors.blue),
          Container(
            width: winW,
            height: winH,
            child: CustomPaint(
              painter: UnitPainter(factor: _factor),
            ),
          ),
          buildText(winH, winW),
          buildHead(),
          buildPower(),
        ],
      ),
    );
  }

  Widget buildLogo(Color primaryColor) {
    return SlideTransition(
      position:
      //初始化一个补间动画 实例化一个补间类动画的实例，明确需要变换的区间大小和作用的controller对象
          Tween(begin: Offset(0, 0), end: Offset(0, -1.5)).animate(_controller),//调用 animate() 方法，传入一个控制器对象，返回一个 Animation<T>
      child: ScaleTransition(
        scale: Tween(begin: 2.0, end: 1.0).animate(_controller),
        child: FadeTransition(
          //AnimationController是一个特殊的Animation对象，在屏幕刷新的每一帧，就会生成一个新的值，
          // 默认情况下，AnimationController在给定的时间段内会线性的生成从0.0到1.0的数字
          //用来控制动画的开始与结束以及设置动画的监听
          opacity: Tween(begin: 0.0, end: 1.0).animate(_controller),//这里也可以直接使用AnimationController，默认从0到1
          child: Container(
            height: 120,
            child: FlutterLogo(
              colors: primaryColor,
              style: _animEnd
                  ? FlutterLogoStyle.horizontal
                  : FlutterLogoStyle.markOnly,
              size: _animEnd ? 150 : 45,
            ),
          ),
        ),
      ),
    );
  }

  Positioned buildText(double winH, double winW) {
    final shadowStyle = TextStyle(
      fontSize: 45,
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.bold,//粗体
      shadows: [
        Shadow(
          //阴影
          color: Colors.grey,
          offset: Offset(1.0, 1.0), blurRadius: 1.0,
        )
      ],
    );

    //在水平方向时，你只能指定left、right、width三个属性中的两个，如指定left和width后，right会自动算出(left+width)，如果同时指定三个属性则会报错，垂直方向同理。
    return Positioned(
      top: winH / 1.55,
      child: Container(
        height: 150,
        width: winW,
        child: AlignTransition(
          alignment:
          AlignmentTween(begin: Alignment(-1, 0), end: Alignment.center)
              .animate(_secondController),
          child: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: _animEnd ? 1.0 : 0.0,
              child: ShaderMask(//ShaderMask是用于实现子控件渐变的控件
                  shaderCallback: _buildShader,
                  child: Text(
                    '小官在江湖',
                    style: shadowStyle,
                  ))),
        ),
      ),
    );
  }
  final colors = [Colors.pink, Colors.cyanAccent, Colors.red];

  Shader _buildShader(Rect bounds) => RadialGradient(//Shader Function(Rect bounds);
      center: Alignment.topLeft,
      radius: 1.2,
      tileMode: TileMode.mirror,
      colors: colors)
      .createShader(bounds);

  Widget buildHead() {
    return SlideTransition(
        position: Tween<Offset>(
          end: Offset(0, 0),
          begin: Offset(0, -5),
        ).animate(_controller),
        child: Container(
          height: 35,
          width: 35,
          child: Image.asset('assets/images/icon_head.png'),
        ));
  }
  Widget buildPower() {
    return Positioned(
      bottom: 30,
      right: 30,
      child: AnimatedOpacity(//让一个widget淡入或者淡出效果,FadeTransition是自定义的，可以通过control来控制。而AnimatedOpacity是个内置的动画，不需要管理那么多，就简单使用效果。
          duration: Duration(milliseconds: 1000),
          opacity: _animEnd ? 1.0 : 0.0,
          child: Text("小官在江湖出品",
              style: TextStyle(
                  color: Colors.grey,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        blurRadius: 1,
                        offset: Offset(0.3, 0.3))
                  ],
                  fontSize: 16))),
    );
  }
}
