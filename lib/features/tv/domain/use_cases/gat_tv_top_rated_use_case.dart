import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/base_movie_use_case/base_movie_use_case.dart';
import 'package:movie/core/error_handel/exception/failure.dart';
import 'package:movie/features/tv/domain/entities/tv.dart';
import 'package:movie/features/tv/domain/repositories/base_tv_repository.dart';

part 'gat_tv_popular_use_case.dart';

part 'get_tv_details_use_case.dart';

part 'get_tv_videos_use_cse.dart';
part 'sesarch_tv_use_case.dart';

class GetTvTopRatedUseCase extends BaseUseCase<List<Tv>, NoParameter> {
  final BaseTvRepository baseTvRepository;

  GetTvTopRatedUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(NoParameter parameter) {
    return baseTvRepository.getTopRatedTv();
  }
}
