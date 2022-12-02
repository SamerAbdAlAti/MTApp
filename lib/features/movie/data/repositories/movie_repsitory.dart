import 'package:dartz/dartz.dart';
import 'package:movie/core/error_handel/exception/exception.dart';
import 'package:movie/core/error_handel/exception/failure.dart';
import 'package:movie/features/movie/data/remote/data_sources/remote_data_source.dart';
import 'package:movie/features/movie/data/remote/models/movie_details_model.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';
import 'package:movie/features/movie/domain/repositories/base_movie_repository.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieDataSource;

  MovieRepository(this.baseMovieDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie() async {
    final result = await baseMovieDataSource.getNowPlayingMovie();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovie() async {
    final result = await baseMovieDataSource.getPopularMovie();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovie() async {
    final result = await baseMovieDataSource.getTopRatedMovie();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieID) async {
    final result = await baseMovieDataSource.getMovieDetails(movieID);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieVideos>>> getMovieVideos(int movieID) async {
    final result = await baseMovieDataSource.getMovieVideos(movieID);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
