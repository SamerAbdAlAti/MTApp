import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';
import 'package:movie/features/movie/domain/repositories/base_movie_repository.dart';

import '../../../../core/error_handel/exception/failure.dart';

class GetTopRatedUseCase extends Equatable {
  final BaseMovieRepository baseMovieRepository;

  const GetTopRatedUseCase(this.baseMovieRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepository.getTopRatedMovie();
  }

  @override
  List<Object> get props => [baseMovieRepository];
}
