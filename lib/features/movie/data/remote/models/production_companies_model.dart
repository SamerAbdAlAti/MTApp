import 'package:movie/features/movie/domain/entities/movie.dart';
import 'package:movie/features/tv/domain/entities/tv.dart';

class ProductionCompaniesModel extends ProductionCompanies {
  const ProductionCompaniesModel({
    required super.id,
    required super.name,
    required super.logoPath,
    required super.originCountry,

  });

  factory ProductionCompaniesModel.fromJson(Map<String, dynamic> json) =>
      ProductionCompaniesModel(
        id: json['id'],
        name: json['name'],
        logoPath: json['logo_path'],
        originCountry: json['origin_country']
      );

}
