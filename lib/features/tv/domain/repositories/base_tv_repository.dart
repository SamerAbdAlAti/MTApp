import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/error_handel/exception/failure.dart';
import 'package:movie/features/tv/domain/entities/tv.dart';

abstract class BaseTvRepository extends Equatable {
  Future<Either<Failure, List<Tv>>> getTopRatedTv();

  Future<Either<Failure, List<Tv>>> getPopularTv();

  Future<Either<Failure, TvDetails>> getTvDetails({required int tvId});

  @override
  List<Object> get props => [];
}
