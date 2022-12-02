import 'package:movie/features/movie/data/remote/models/production_companies_model.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';
import 'package:movie/features/tv/data/remote/models/tv_production_companies_model.dart';
import 'package:movie/features/tv/domain/entities/tv.dart';

part 'tv_details_model.dart';

class TvModel extends Tv {
  const TvModel({
    required super.id,
    required super.name,
    required super.backdropPath,
    required super.posterPath,
    required super.overview,
    required super.voteAverage,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        id: json['id'],
        name: json['name'],
        backdropPath: json['backdrop_path'],
        posterPath: json['poster_path'],
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
      );
}
