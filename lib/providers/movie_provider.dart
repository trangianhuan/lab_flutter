import 'package:flutter/material.dart';
import 'package:lab_flutter/models/genre_model.dart';
import 'package:lab_flutter/services/MovieService.dart';

import '../models/movie_model.dart';

class MovieProvider extends ChangeNotifier {
  final movieService = MovieService();
  final int limit = 20;
  int page = 0;
  bool hasNextPage = true;
  bool isLoadMoreRunning = false;

  final List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;

  final List<GenreModel> _genres = [];
  List<GenreModel> get genres => _genres;

  void initGenres() async {
    try {
      print('call initGenres');
      final List<GenreModel> fetchedGenre = await movieService.getGenres();
      if (fetchedGenre.isNotEmpty) {
        _genres.addAll(fetchedGenre);
      }
      notifyListeners();
    } catch (err, stack) {
      print('Error! initGenres $err $stack');
    }
  }

  void fetchData() async {
    if (hasNextPage == true && isLoadMoreRunning == false) {
      isLoadMoreRunning = true;
      print('call fetchData');
      page += 1;

      try {
        final List<MovieModel> fetchedMovie =
            await movieService.getMovies(page, limit);
        if (fetchedMovie.isNotEmpty) {
          _movies.addAll(fetchedMovie);
        } else {
          hasNextPage = false;
        }
      } catch (err, stack) {
        print('Error! fetchData $err $stack');
      }

      isLoadMoreRunning = false;
      notifyListeners();
    }
  }
}
