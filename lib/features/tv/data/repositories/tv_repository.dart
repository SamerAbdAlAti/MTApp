import 'package:dartz/dartz.dart';
import 'package:movie/core/error_handel/exception/exception.dart';
import 'package:movie/core/error_handel/exception/failure.dart';
import 'package:movie/features/tv/data/remote/data_sources/tv_data_source.dart';
import 'package:movie/features/tv/domain/entities/tv.dart';
import 'package:movie/features/tv/domain/repositories/base_tv_repository.dart';

class TvRepository extends BaseTvRepository {
  final BaseTvRemoteDataSource baseTvRemoteDataSource;

  TvRepository(this.baseTvRemoteDataSource);

  @override
  Future<Either<Failure, List<Tv>>> getPopularTv() async {
    final result = await baseTvRemoteDataSource.gatPopularTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTv() async {
    final result = await baseTvRemoteDataSource.gatTopRatedTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TvDetails>> getTvDetails({required int tvId}) async {
    final result = await baseTvRemoteDataSource.getTvDetails(tvId: tvId);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvVideos>>> getTvVideos(
      {required int tvId}) async {
    final result = await baseTvRemoteDataSource.getTvVideos(tvId: tvId);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> searchTv({required String query}) async {
    final result = await baseTvRemoteDataSource.searchTv(query: query);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
