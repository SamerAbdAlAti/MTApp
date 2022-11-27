import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/base_movie_use_case/base_movie_use_case.dart';
import 'package:movie/core/error_handel/exception/failure.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';
import 'package:movie/features/movie/domain/repositories/base_movie_repository.dart';
part 'get_movie_details_use_case.dart';
class GetNowPlayingUseCase extends BaseUseCase<List<Movie>,NoParameter> {

  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure,List<Movie>>> call(NoParameter parameter)async {
    return await baseMovieRepository.getNowPlayingMovie();
  }

}