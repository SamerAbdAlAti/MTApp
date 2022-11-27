part of 'movie.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final String ?backdropPath;
  final String ?posterPath;
  final String ?overview;
  final List<Genres>? genres;
  final List<ProductionCompanies> ?productionCompanies;
  final double ?voteAverage;
  final String ?releaseDate;
  final double ?runtime;
  final double ?popularity;

  const MovieDetails({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.posterPath,
    required this.overview,
    required this.genres,
    required this.productionCompanies,
    required this.voteAverage,
    required this.releaseDate,
    required this.runtime,
    required this.popularity,
  });

  @override
  List<Object> get props => [
        id,
        title,
      ];
}
