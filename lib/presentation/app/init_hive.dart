
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

class InitHive {

  Future<void> create() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    await Hive.openBox("auth");
    await Hive.openBox("user");
  }
}