import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
  final List<int> genreIds;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.genreIds,
  });

  @override
  List<Object> get props =>
      [
        id,
        title,
        overview,
        backdropPath,
        posterPath,
        releaseDate,
        voteAverage,
        genreIds,
      ];
}
