import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/api/constant/constant.dart';
import 'package:movie_app/model/movie_model.dart';

class MovieApi {
  final upComingApiUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";
  final popularApiUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";
  final topRatedApiUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey";

  Future<List<MovieModel>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(upComingApiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<MovieModel> movies =
          data.map((movie) => MovieModel.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  Future<List<MovieModel>> getPopularMovies() async {
    final response = await http.get(Uri.parse(popularApiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<MovieModel> movies =
          data.map((movie) => MovieModel.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedApiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<MovieModel> movies =
          data.map((movie) => MovieModel.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }
}
