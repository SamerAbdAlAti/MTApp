part of 'gat_tv_top_rated_use_case.dart';

class GetTvVideosUseCase
    extends BaseUseCase<List<TvVideos>, TvVideosParameter> {
  final BaseTvRepository baseTvRepository;

  GetTvVideosUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<TvVideos>>> call(
      TvVideosParameter parameter) async {
    return await baseTvRepository.getTvVideos(tvId: parameter.tvId);
  }
}

class TvVideosParameter extends Equatable {
  final int tvId;

  const TvVideosParameter({
    required this.tvId,
  });

  @override
  List<Object> get props => [tvId];
}
