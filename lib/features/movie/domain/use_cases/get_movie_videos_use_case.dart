part of 'get_now_playing_use_case.dart';

class GetMovieVideosUseCase
    extends BaseUseCase<List<MovieVideos>, MovieVideosParameter> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieVideosUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<MovieVideos>>> call(
      MovieVideosParameter parameter) {
    return baseMovieRepository.getMovieVideos(parameter.movieId);
  }
}

class MovieVideosParameter extends Equatable {
  final int movieId;

  const MovieVideosParameter({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
