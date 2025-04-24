import 'dart:async';

import 'package:cine_max/constants/color.dart';
import 'package:cine_max/controllers/movie_controller.dart';
import 'package:cine_max/view/movie/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final movieController = Get.put(MovieController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieController.fetchMovies().then((_) {
      Get.off(() => const MovieMainScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCustom.BACKGROUND,
      body: Center(
        child: Image.asset("assets/logos/cinemax_logo.png"),
      ),
    );
  }
}
