import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/base_movie_use_case/base_movie_use_case.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';
import 'package:movie/features/movie/domain/repositories/base_movie_repository.dart';

import '../../../../core/error_handel/exception/failure.dart';

class GetPopularUseCase extends BaseUseCase<List<Movie>,NoParameter> {
  final BaseMovieRepository baseMovieRepository;

  GetPopularUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameter) async {
    return await baseMovieRepository.getPopularMovie();
  }
}
