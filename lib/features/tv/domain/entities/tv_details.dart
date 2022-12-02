part of 'tv.dart';

class TvDetails extends Equatable {
  final int id;
  final String name;
  final String? backDroPath;
  final String? posterPath;
  final String overview;
  final List<TvProductionCompanies> productionCompanies;
  final double voteAverage;
  final double voteCount;

  const TvDetails({
    required this.id,
    required this.name,
    required this.backDroPath,
    required this.posterPath,
    required this.overview,
    required this.productionCompanies,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object> get props => [
        id,
        name,
        overview,
        productionCompanies,
        voteAverage,
        voteCount,
      ];
}
