part of 'tv.dart';

class TvVideos extends Equatable {
  final String id;
  final String name;
  final String site;
  final String key;
  final String type;
  final String publishedAt;

  const TvVideos({
    required this.id,
    required this.name,
    required this.site,
    required this.key,
    required this.type,
    required this.publishedAt,
  });

  @override
  List<Object> get props => [
        id,
        name,
        site,
        key,
        type,
        publishedAt,
      ];
}
