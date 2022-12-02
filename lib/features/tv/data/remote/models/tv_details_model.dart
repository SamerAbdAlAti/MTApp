part of 'tv_model.dart';

class TvDetailsModel extends TvDetails {
  const TvDetailsModel({
    required super.id,
    required super.backDroPath,
    required super.name,
    required super.posterPath,
    required super.overview,
    required super.productionCompanies,
    required super.voteAverage,
    required super.voteCount,
  });

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) => TvDetailsModel(
        id: json['id'],
        backDroPath: json['backdrop_path'],
        posterPath: json['poster_path'],
        overview: json['overview'],
        productionCompanies: List<TvProductionCompanies>.from(
            json['production_companies']
                .map((e) => TvProductionCompaniesModel.fromJson(e))),
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'].toDouble(), name: json['name'],
      );
}
