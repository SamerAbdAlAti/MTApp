import 'package:equatable/equatable.dart';

part 'movie_details.dart';

part 'genres.dart';

part 'production_companies.dart';

part 'movie_videos.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String ?backdropPath;
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
  List<Object> get props => [
        id,
        title,
        overview,
        posterPath,
        releaseDate,
        voteAverage,
        genreIds,
      ];
}
