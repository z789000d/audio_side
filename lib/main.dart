import 'package:audio_test/page/audio_page.dart';
import 'package:audio_test/page/first_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      builder: EasyLoading.init(),
      initialRoute: '/',
      home: FirstPage(),
      getPages: [
        GetPage(name: '/', page: () => FirstPage()),
        GetPage(name: '/AudioPage', page: () => AudioPage()),
      ],
    );
  }
}
