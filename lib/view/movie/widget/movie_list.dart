import 'package:cine_max/components/movie_card.dart';
import 'package:cine_max/constants/color.dart';
import 'package:cine_max/controllers/movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final MovieController mvCtrl = Get.put(MovieController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (mvCtrl.isLoading.value) {
        return const Center(child: CircularProgressIndicator(strokeWidth: 8,color: ColorCustom.BLUEACCENT,strokeCap: StrokeCap.round,));
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: mvCtrl.filteredMovies.length,
          itemBuilder: (context, index) {
            var movie = mvCtrl.filteredMovies[index];
            return MovieCard(
              name: "${movie.movie}",
              year: "${movie.year}",
              minute: "${movie.movieDuration}",
              image: "${movie.poster}",
            );
          },
        ),
      );
    });
  }
}
