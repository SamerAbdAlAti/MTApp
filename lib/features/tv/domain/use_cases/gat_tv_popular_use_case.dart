part of 'gat_tv_top_rated_use_case.dart';

class GetTvPopularUseCase extends BaseUseCase<List<Tv>, NoParameter> {
  final BaseTvRepository baseTvRepository;

  GetTvPopularUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(NoParameter parameter) {
    return baseTvRepository.getTopRatedTv();
  }
}
