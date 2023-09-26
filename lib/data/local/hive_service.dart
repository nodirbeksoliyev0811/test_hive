import 'package:hive/hive.dart';

class HiveService{
  static late Box box;
  static openBox()async{
    box = await Hive.openBox("save_favorite");
  }
}