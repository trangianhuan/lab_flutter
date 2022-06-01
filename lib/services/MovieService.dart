import 'package:dio/dio.dart';
import 'package:lab_flutter/models/genre_model.dart';
import 'package:lab_flutter/models/movie_model.dart';

class MovieService {
  final dio = Dio();
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final String _apiKey = '3db15547899827d6f052061824b3bc50';
  final String movieUrl = 'movie/popular';
  final String genreUrl = 'genre/movie/list';

  Future<List<MovieModel>> getMovies(int page, int limit) async {
    List<MovieModel> _movies = [];
    final res = await dio.get(Uri.parse(
            "$_baseUrl/$movieUrl?api_key=$_apiKey&_page=$page&_limit=$limit")
        .toString());
    final List fetchedMovie = res.data['results'];

    if (fetchedMovie.isNotEmpty) {
      _movies.addAll(fetchedMovie.map((e) {
        return MovieModel.fromMap(e);
      }).toList());
    }

    return _movies;
  }

  Future<List<GenreModel>> getGenres() async {
    List<GenreModel> _genres = [];
    final res = await dio
        .get(Uri.parse("$_baseUrl/$genreUrl?api_key=$_apiKey").toString());

    final List fetchedMovie = res.data['genres'];
    if (fetchedMovie.isNotEmpty) {
      _genres.addAll(fetchedMovie.map((e) {
        return GenreModel.fromMap(e);
      }).toList());
    }
    return _genres;
  }
}
