import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterwidgets/blocs/global/global_bloc.dart';
import 'package:flutterwidgets/blocs/global/global_event.dart';
import 'package:flutterwidgets/blocs/global/global_state.dart';
import 'package:flutterwidgets/storage/app_storeage.dart';

import 'repositorys/widget_db_repository.dart';
import 'views/pages/splash/unit_splash.dart';
void main() => runApp(BlocWrapper(child:FlutterApp()));

final storage = Appstorage();

class BlocWrapper extends StatelessWidget{
  final Widget child;
  BlocWrapper({this.child});

  final repository = WidgetDbRepository(storage);

  @override
  Widget build(BuildContext context) {
    //    如果你要创建一个新的 bloc 给子树使用，就可以使用 BlocProvider 的默认构造函数来创建 bloc 实例，会有自动释放 bloc 的功能。
//    但是如果只是要给子树提供一个已经存在的 bloc 实例，这个时候就不需要自动释放 bloc 的功能，
//    所以使用 BlocProvider 的 value 构造函数。想要释放 bloc 的话，就在创建 bloc 的地方释放。
    // TODO: implement build
    return MultiBlocProvider(providers: [
      //Bloc提供器
      BlocProvider<GlobalBloc>(create: (BuildContext context){
        return GlobalBloc(storage)..add(EventInitApp());
      }),
    ], child: child);
  }
}

class FlutterApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<GlobalBloc,GlobalState>(builder: (_,state){
      return MaterialApp(
        title: "Flutter Demo",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: state.themeColor,fontFamily: state.fontFamily),//primarySwatch类型为MaterialColor,primaryColor类型为color
        home: UnitSplash(),
      );
    });

  }
}

