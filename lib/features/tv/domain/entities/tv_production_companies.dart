part of 'tv.dart';

class TvProductionCompanies extends Equatable {
  final int id;
  final String name;
  final String ?logoPath;

  const TvProductionCompanies({
    required this.id,
    required this.name,
    required this.logoPath,
  });

  @override
  List<Object> get props => [
        id,
        name,
      ];
}
