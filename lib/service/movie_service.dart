import 'dart:convert';
import 'package:cine_max/service/api.endpoints.dart';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class MovieService {
  static Future<List<MovieModel>> fetchMovies() async {
    try {
      final response = await http.get(
        Uri.parse(ApiEndPoints().movie),
      );

      final data = jsonDecode(response.body);
      return (data as List).map((e) => MovieModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed: $e');
    }
  }
}
