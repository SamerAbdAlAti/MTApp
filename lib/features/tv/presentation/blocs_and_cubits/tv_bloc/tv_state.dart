part of 'tv_bloc.dart';

class TvState extends Equatable {
  final List<Tv> tvTopRated;
  final RequestsState tvTopRatedState;
  final String tvTopRatedMessage;

  final List<Tv> tvPopular;
  final RequestsState tvPopularState;
  final String tvPopularMessage;

  final TvDetails getTvDetails;
  final RequestsState tvDetailsState;
  final String tvDetailsMessage;

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
      ];
}
