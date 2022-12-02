part of 'gat_tv_top_rated_use_case.dart';

class GetTvDetailsUseCase extends BaseUseCase<TvDetails, TvDetailsParameter> {
  final BaseTvRepository baseTvRepository;

  GetTvDetailsUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, TvDetails>> call(TvDetailsParameter parameter) async {
    return await baseTvRepository.getTvDetails(tvId: parameter.tvId);
  }
}

class TvDetailsParameter extends Equatable {
  final int tvId;

  const TvDetailsParameter({
    required this.tvId,
  });

  @override
  List<Object> get props => [tvId];
}
