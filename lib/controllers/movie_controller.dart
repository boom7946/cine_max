import 'package:cine_max/service/movie_service.dart';
import 'package:get/get.dart';
import '../models/movie_model.dart';

class MovieController extends GetxController {
  RxList<MovieModel> movies = <MovieModel>[].obs;
  RxList<MovieModel> filteredMovies = <MovieModel>[].obs;
  RxBool isLoading = true.obs;
  RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
    ever(searchQuery, (_) => filterMovies());
  }

  Future<void> fetchMovies() async {
    try {
      isLoading.value = true;
      final result = await MovieService.fetchMovies();
      movies.value = result;
      filteredMovies.value = result;
    } finally {
      isLoading.value = false;
    }
  }

  void filterMovies() {
    final query = searchQuery.value.toLowerCase();
    filteredMovies.value = movies.where((movie) {
      final title = movie.movie?.toLowerCase() ?? '';
      return title.contains(query);
    }).toList();
  }
}
