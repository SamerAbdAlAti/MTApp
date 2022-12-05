import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/error_handel/exception/failure.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';

abstract class BaseMovieRepository extends Equatable {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie();

  Future<Either<Failure, List<Movie>>> getTopRatedMovie();

  Future<Either<Failure, List<Movie>>> getPopularMovie();
  Future<Either<Failure, List<Movie>>> searchToFindMovie({required String query});

  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieID);

  Future<Either<Failure, List<MovieVideos>>> getMovieVideos(int movieID);

  @override
  List<Object> get props => [];
}
