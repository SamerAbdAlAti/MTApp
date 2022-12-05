import 'package:movie/features/tv/domain/entities/tv.dart';

class TvVideosModel extends TvVideos {
  const TvVideosModel({
    required super.id,
    required super.name,
    required super.site,
    required super.key,
    required super.type,
    required super.publishedAt,
  });

  factory TvVideosModel.fromJson(Map<String, dynamic> json) => TvVideosModel(
        id: json['id'],
        name: json['name'],
        site: json['site'],
        key: json['key'],
        publishedAt: json['published_at'],
        type: json['type'],
      );
}
