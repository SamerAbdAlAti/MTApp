import 'package:dartz/dartz.dart';
import 'package:movie/core/error_handel/exception/failure.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie();

  Future<Either<Failure, List<Movie>>> getTopRatedMovie();

  Future<Either<Failure, List<Movie>>> getPopularMovie();
}
