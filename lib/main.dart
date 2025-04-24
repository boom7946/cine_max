import 'package:cine_max/view/movie/main.dart';
import 'package:cine_max/view/splash/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CINEMAX',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const MovieMainScreen(),
    );
  }
}
