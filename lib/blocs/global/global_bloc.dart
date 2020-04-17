
import 'package:flutterwidgets/app/res/cons.dart';
import 'package:flutterwidgets/app/res/sp.dart';
import 'package:flutterwidgets/blocs/global/global_event.dart';
import 'package:flutterwidgets/blocs/global/global_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutterwidgets/storage/app_storeage.dart';
import 'package:shared_preferences/shared_preferences.dart';
class GlobalBloc extends Bloc<GlobalEvent,GlobalState>{
  final Appstorage storage ;
  @override
  GlobalState get initialState {
    return GlobalState();
  }
  GlobalBloc(this.storage);

  Future<SharedPreferences> get sp => storage.sp;

  //Bloc(Business Logic Component 业务逻辑组件)是将传入事件流转换为传出状态流的组件(event返回一个state)
  //该函数将传入的event作为参数，并必须返回表示层使用的新状态流。我们可以在任何时候使用state属性访问当前的Bloc状态。
  @override
  Stream<GlobalState> mapEventToState(GlobalEvent event) async*{//加上星号其实就是「函数生成器」的意思
    if(event is EventInitApp){
      yield await storage.initApp();
    }

//    级联(..)允许您对同一对象执行一系列操作
    if (event is EventSwitchFontFamily) {
      var familyIndex = Cons.fontFamilySupport.indexOf(event.family);
      await sp..setInt(SP.fontFamily, familyIndex); //固化数据
      yield state.copyWith(fontFamily: event.family);
    }

    if (event is EventSwitchThemeColor) {
      //map参数为一个单数组是，keys获取的是所有下表，为双数组是获取的是键，比如这里keys标示的是所有MaterialColor的集合
      var themeIndex =
      Cons.themeColorSupport.keys.toList().indexOf(event.color);
      await sp
        ..setInt(SP.themeColorIndex, themeIndex); //固化数据
      yield state.copyWith(themeColor: event.color);
    }

    if (event is EventSwitchShowBg) {
      await sp
        ..setBool(SP.showBackground, event.show); //固化数据
      yield state.copyWith(showBackGround: event.show);
    }

    if (event is EventSwitchCoderTheme) {
      await sp
        ..setInt(SP.codeStyleIndex, event.codeStyleIndex); //固化数据
      yield state.copyWith(codeStyleIndex: event.codeStyleIndex);
    }
    if (event is EventChangeItemStyle) {
      await sp
        ..setInt(SP.itemStyleIndex, event.index); //固化数据
      print('EventChangeItemStyle+${event.index}');
      yield state.copyWith(itemStyleIndex: event.index);
    }
  }
}