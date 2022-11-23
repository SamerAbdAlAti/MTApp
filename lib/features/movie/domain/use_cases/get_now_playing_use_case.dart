import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/error_handel/exception/failure.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';
import 'package:movie/features/movie/domain/repositories/base_movie_repository.dart';

class GetNowPlayingUseCase extends Equatable {

  final BaseMovieRepository baseMovieRepository;

  const GetNowPlayingUseCase(this.baseMovieRepository);

  Future<Either<Failure,List<Movie>>> execute()async {
    return await baseMovieRepository.getNowPlayingMovie();
  }

  @override
  List<Object> get props => [baseMovieRepository];
}