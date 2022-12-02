part of 'movie.dart';

class MovieVideos extends Equatable {
  final String id;
  final String publishedAt;
  final String name;
  final String site;
  final String key;
  final String type;
  final int size;

  const MovieVideos({
    required this.id,
    required this.name,
    required this.publishedAt,
    required this.site,
    required this.key,
    required this.type,
    required this.size,
  });

  @override
  List<Object> get props => [
        id,
        name,
        publishedAt,
        site,
        key,
    type,
        size,
      ];
}
