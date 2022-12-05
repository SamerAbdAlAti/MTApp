part of 'get_now_playing_use_case.dart';

class MovieSearchUseCase
    extends BaseUseCase<List<Movie>, MovieSearchParameter> {
  final BaseMovieRepository baseMovieRepository;

  MovieSearchUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(
      MovieSearchParameter parameter) async {
    return await baseMovieRepository.searchToFindMovie(query: parameter.query);
  }
}

class MovieSearchParameter extends Equatable {
  final String query;

  const MovieSearchParameter({required this.query});

  @override
  List<Object> get props => [query];
}
