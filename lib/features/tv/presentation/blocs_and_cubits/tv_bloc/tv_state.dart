part of 'tv_bloc.dart';

class TvState extends Equatable {
  final List<Tv> tvTopRated;
  final RequestsState tvTopRatedState;
  final String tvTopRatedMessage;

  final List<Tv> tvPopular;
  final RequestsState tvPopularState;
  final String tvPopularMessage;

  final List<Tv> tvSearch;
  final RequestsState tvSearchState;
  final String tvSearchMessage;

  final TvDetails getTvDetails;
  final RequestsState tvDetailsState;
  final String tvDetailsMessage;

  final List<TvVideos> getTvVideos;
  final RequestsState tvVideosState;
  final String tvVideosMessage;

  const TvState({
    this.tvTopRated = const [],
    this.tvTopRatedState = RequestsState.loading,
    this.tvTopRatedMessage = '',
    this.tvPopular = const [],
    this.tvPopularState = RequestsState.loading,
    this.tvPopularMessage = '',
    this.getTvDetails = const TvDetails(
        id: -22,
        voteAverage: -2.0,
        posterPath: "",
        overview: "",
        backDroPath: "",
        productionCompanies: [],
        name: '',
        voteCount: -2.0),
    this.tvDetailsState = RequestsState.loading,
    this.tvDetailsMessage = "",
    this.getTvVideos = const [],
    this.tvVideosState = RequestsState.loading,
    this.tvVideosMessage = '',
    this.tvSearch = const [],
    this.tvSearchState = RequestsState.loaded,
    this.tvSearchMessage = '',
  });

  TvState copyWith({
    List<Tv>? tvTopRated,
    RequestsState? tvTopRatedState,
    String? tvTopRatedMessage,
    List<Tv>? tvPopular,
    RequestsState? tvPopularState,
    String? tvPopularMessage,
    TvDetails? getTvDetails,
    RequestsState? tvDetailsState,
    String? tvDetailsMessage,
    List<TvVideos>? getTvVideos,
    RequestsState? tvVideosState,
    String? tvVideosMessage,
    List<Tv>? tvSearch,
    RequestsState? tvSearchState,
    String? tvSearchMessage,
  }) {
    return TvState(
      tvTopRated: tvTopRated ?? this.tvTopRated,
      tvTopRatedState: tvTopRatedState ?? this.tvTopRatedState,
      tvTopRatedMessage: tvTopRatedMessage ?? this.tvTopRatedMessage,
      tvPopular: tvPopular ?? this.tvPopular,
      tvPopularState: tvPopularState ?? this.tvPopularState,
      tvPopularMessage: tvPopularMessage ?? this.tvPopularMessage,
      getTvDetails: getTvDetails ?? this.getTvDetails,
      tvDetailsMessage: tvDetailsMessage ?? this.tvDetailsMessage,
      tvDetailsState: tvDetailsState ?? this.tvDetailsState,
      getTvVideos: getTvVideos ?? this.getTvVideos,
      tvVideosState: tvVideosState ?? this.tvVideosState,
      tvVideosMessage: tvVideosMessage ?? this.tvVideosMessage,
      tvSearch: tvSearch ?? this.tvSearch,
      tvSearchState: tvSearchState ?? this.tvSearchState,
      tvSearchMessage: tvSearchMessage ?? this.tvSearchMessage,
    );
  }

  @override
  List<Object> get props => [
        tvTopRated,
        tvTopRatedState,
        tvTopRatedMessage,
        tvPopular,
        tvPopularState,
        tvPopularMessage,
        getTvDetails,
        tvDetailsState,
        tvDetailsMessage,
        getTvVideos,
        tvVideosState,
        tvVideosMessage,
        tvSearch,
        tvSearchState,
        tvSearchMessage,
      ];
}
