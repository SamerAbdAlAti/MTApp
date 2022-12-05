part of 'gat_tv_top_rated_use_case.dart';

class SearchTvUseCase extends BaseUseCase<List<Tv>, SearchTvParameter> {
  final BaseTvRepository baseTvRepository;

  SearchTvUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(SearchTvParameter parameter) async {
    return await baseTvRepository.searchTv(query: parameter.query);
  }
}

class SearchTvParameter extends Equatable {
  final String query;

  const SearchTvParameter({required this.query});

  @override
  List<Object> get props => [query];
}
