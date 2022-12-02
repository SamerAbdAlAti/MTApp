import 'package:movie/features/movie/domain/entities/movie.dart';

class MovieVideosModel extends MovieVideos {
  const MovieVideosModel({
    required super.id,
    required super.name,
    required super.publishedAt,
    required super.site,
    required super.key,
    required super.type,
    required super.size,
  });

  factory MovieVideosModel.fromJson(Map<String, dynamic> json) =>
      MovieVideosModel(
        id: json['id'].toString(),
        name:json['name'].toString(),
        publishedAt: json['published_at'].toString(),
        site: json['site'].toString(),
        key: json['key'].toString(),
        size: json['size'].toInt(), type: json['type'].toString(),

      );
}
