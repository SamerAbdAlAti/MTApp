import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';
import 'package:movie/features/movie/domain/repositories/base_movie_repository.dart';

import '../../../../core/error_handel/exception/failure.dart';

class GetPopularUseCase extends Equatable {
  final BaseMovieRepository baseMovieRepository;

  const GetPopularUseCase(this.baseMovieRepository);

  Future<Either<Failure,List<Movie>>> execute() async {
    return await baseMovieRepository.getPopularMovie();
  }

  @override
  List<Object> get props => [baseMovieRepository];
}
