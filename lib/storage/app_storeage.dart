import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutterwidgets/app/res/cons.dart';
import 'package:flutterwidgets/app/res/sp.dart';
import 'package:flutterwidgets/blocs/global/global_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'dart:io';
class Appstorage{
  SharedPreferences _sp;
  Database _database;
/*  Future对象表示异步操作的结果，我们通常通过then（）来处理返回的结果
  async用于标明函数是一个异步函数，其返回值类型是Future类型
  await用来等待耗时操作的返回结果，这个操作会阻塞到后面的代码*/
  Future<SharedPreferences> get sp async{
    _sp = _sp ?? await SharedPreferences.getInstance();
    return _sp;
  }

  Future<Database> get db async {
    _database = _database ?? await initDb();
    return _database;
  }

  // 初始化 App 固化的配置数据
  Future<GlobalState> initApp() async{
    var prefs = await sp;
    _database = await initDb();
    var showBg = prefs.getBool(SP.showBackground) ?? true;
    var themeIndex = prefs.getInt(SP.themeColorIndex) ?? 4;
    var fontIndex = prefs.getInt(SP.fontFamily) ?? 1;
    var codeIndex = prefs.getInt(SP.codeStyleIndex) ?? 0;
    var itemStyleIndex = prefs.getInt(SP.itemStyleIndex) ?? 0;

    return GlobalState(
        showBackGround: showBg,
        themeColor: Cons.themeColorSupport.keys.toList()[themeIndex],
        fontFamily: Cons.fontFamilySupport[fontIndex],
        itemStyleIndex: itemStyleIndex,
        codeStyleIndex: codeIndex);
  }

  // 初始化数据库,将二进制文件存储至指定路径,将sqlite数据库存储至项目文件夹内，可以正常的通过sqflite使用
  Future<Database> initDb() async {
    // 获取数据库文件的存储路径
    var databasesPath = await getDatabasesPath();
    var dbPath = path.join(databasesPath, "flutter.db");
    var exists = await databaseExists(dbPath);
    if (!exists) {
      print("Creating new copy from asset");
      try {
        //创建路径
        await  Directory(path.dirname(dbPath)).create(recursive: true);
      } catch (_) {}

//    每个Flutter App都有一个rootBundle对象来方便的访问主资源Bundle。可以通过package:flutter/services.dard中的全局静态变量rootBundle来直接访问资源
//    不过还是推荐使用当前的BuildContext来获取DefaultAssetBundle，通过调用DefaultAssetBundle.of(context)来获取。

    //flutter资源路径，需要提前配置好，保证可用，路径的最后要标注文件名与后缀，例如file.db
      ByteData data = await rootBundle.load(path.join("assets", "flutter.db"));//加载图片/二进制文件：通过load方法
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      ////写文件
      await File(dbPath).writeAsBytes(bytes, flush: true);

    } else {
      print("Opening existing database");
    }
    return await openDatabase(dbPath, readOnly: false);
  }

}