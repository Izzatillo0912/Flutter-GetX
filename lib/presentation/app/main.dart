import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/presentation/app/init_hive.dart';
import 'package:getx_clean_architecture/presentation/app/main_scaffold.dart';
import 'package:getx_clean_architecture/presentation/screens/home/home_screen.dart';
import 'package:hive_flutter/adapters.dart';
import '../utils/bindings/home_binding.dart';

Future<void> main() async {

  InitHive().create();
  await Hive.initFlutter();
  await Hive.openBox('auth');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages : [
        GetPage(
          name: '/home',
          page: () => MainScaffold(child: HomeScreen()),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}


