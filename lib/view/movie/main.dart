import 'package:cine_max/constants/color.dart';
import 'package:cine_max/controllers/movie_controller.dart';
import 'package:cine_max/view/movie/widget/movie_list.dart';
import 'package:cine_max/view/movie/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MovieMainScreen extends StatefulWidget {
  const MovieMainScreen({super.key});

  @override
  State<MovieMainScreen> createState() => _MovieMainScreenState();
}

class _MovieMainScreenState extends State<MovieMainScreen> {
  final movieController = Get.put(MovieController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieController.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorCustom.BACKGROUND,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SaerchMovieBar(),
              Expanded(
                child: MovieList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
