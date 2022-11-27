part of 'get_now_playing_use_case.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameter> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure,MovieDetails>> call(
      MovieDetailsParameter parameter) async {
    return await baseMovieRepository.getMovieDetails(parameter.movieId);
  }
}

class MovieDetailsParameter extends Equatable {
  final int movieId;

  const MovieDetailsParameter({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
