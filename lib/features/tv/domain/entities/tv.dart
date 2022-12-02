import 'package:equatable/equatable.dart';

part 'tv_details.dart';
part 'tv_production_companies.dart';

class Tv extends Equatable {
  final int id;
  final String name;
  final String? backdropPath;
  final String posterPath;
  final String overview;
  final double voteAverage;

  const Tv({
    required this.id,
    required this.name,
    required this.backdropPath,
    required this.posterPath,
    required this.overview,
    required this.voteAverage,
  });

  @override
  List<Object> get props => [
        id,
        name,
        posterPath,
        overview,
        voteAverage,
      ];
}
