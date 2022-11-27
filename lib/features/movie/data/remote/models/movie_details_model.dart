import 'package:movie/features/movie/data/remote/models/genres_model.dart';
import 'package:movie/features/movie/data/remote/models/production_companies_model.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.posterPath,
    required super.overview,
    required super.genres,
    required super.productionCompanies,
    required super.voteAverage,
    required super.releaseDate,
    required super.runtime,
    required super.popularity,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      overview: json['overview'],
      productionCompanies: List<ProductionCompanies>.from(
          json["production_companies"]
              .map((e) => ProductionCompaniesModel.fromJson(e))),
      voteAverage: json['vote_average'].toDouble(),
      runtime: json['runtime'].toDouble(),
      releaseDate: json['release_date'],
      genres: List.from(json['genres'].map((e) => GenresModel.fromJson(e))),
      popularity: json['popularity'].toDouble(),
    );
  }
}
