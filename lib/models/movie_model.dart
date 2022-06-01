import 'dart:convert';

import 'package:flutter/foundation.dart';

class MovieModel {
  final String title;
  final String backdropPath;
  final String posterPath;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final List<int> genreIds;
  MovieModel({
    required this.title,
    required this.backdropPath,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
  });

  MovieModel copyWith({
    String? title,
    String? backdropPath,
    String? posterPath,
    String? overview,
    String? releaseDate,
    double? voteAverage,
    int? voteCount,
    List<int>? genreIds,
  }) {
    return MovieModel(
      title: title ?? this.title,
      backdropPath: backdropPath ?? this.backdropPath,
      posterPath: posterPath ?? this.posterPath,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      genreIds: genreIds ?? this.genreIds,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'backdropPath': backdropPath,
      'posterPath': posterPath,
      'overview': overview,
      'releaseDate': releaseDate,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
      'genreIds': genreIds,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      title: map['title'] ?? '',
      backdropPath: 'https://image.tmdb.org/t/p/w500/' + map['backdrop_path'],
      posterPath: 'https://image.tmdb.org/t/p/w500/' + map['poster_path'],
      overview: map['overview'] ?? '',
      releaseDate: map['release_date'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      voteCount: map['vote_count']?.toInt() ?? 0,
      genreIds: List<int>.from(map['genre_ids']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieModel(title: $title, backdropPath: $backdropPath, posterPath: $posterPath, overview: $overview, releaseDate: $releaseDate, voteAverage: $voteAverage, voteCount: $voteCount, genreIds: $genreIds)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieModel &&
        other.title == title &&
        other.backdropPath == backdropPath &&
        other.posterPath == posterPath &&
        other.overview == overview &&
        other.releaseDate == releaseDate &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount &&
        listEquals(other.genreIds, genreIds);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        backdropPath.hashCode ^
        posterPath.hashCode ^
        overview.hashCode ^
        releaseDate.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode ^
        genreIds.hashCode;
  }
}
