import 'package:movie/features/tv/domain/entities/tv.dart';

class TvProductionCompaniesModel extends TvProductionCompanies {
  const TvProductionCompaniesModel({
    required super.id,
    required super.name,
    required super.logoPath,
  });

  factory TvProductionCompaniesModel.fromJson(Map<String, dynamic> json) =>
      TvProductionCompaniesModel(
        id: json['id'],
        name: json['name'],
        logoPath: json['logo_path'],
      );
}
