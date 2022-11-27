part of 'movie_bloc.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovie;
  final RequestsState nowPlayingState;
  final String nowPlayingMessage;

  final List<Movie> topRatedMovie;
  final RequestsState topRatedState;
  final String topRatedMessage;

  final List<Movie> popularMovie;
  final RequestsState popularState;
  final String popularMessage;

  final MovieDetails movieDetails;
  final RequestsState movieDetailsState;
  final String movieDetailsMessage;
  final int movieDetailsId;

  const MovieState({
    this.popularMovie = const [],
    this.popularState = RequestsState.loading,
    this.popularMessage = '',
    this.topRatedMovie = const [],
    this.topRatedState = RequestsState.loading,
    this.topRatedMessage = '',
    this.nowPlayingMovie = const [],
    this.nowPlayingState = RequestsState.loading,
    this.nowPlayingMessage = '',
    this.movieDetails = const MovieDetails(
        popularity: 10.0,
        runtime: 212.0,
        title: "",
        backdropPath: "",
        id: -11,
        overview: "",
        posterPath: "",
        genres: [],
        productionCompanies: [],
        releaseDate: "",
        voteAverage: 2.0),
    this.movieDetailsState = RequestsState.loading,
    this.movieDetailsMessage = '',
    this.movieDetailsId = 22211,
  });

  MovieState copyWith({
    List<Movie>? nowPlayingMovie,
    RequestsState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? topRatedMovie,
    RequestsState? topRatedState,
    String? topRatedMessage,
    List<Movie>? popularMovie,
    RequestsState? popularState,
    String? popularMessage,
    MovieDetails? movieDetails,
    RequestsState? movieDetailsState,
    String? movieDetailsMessage,
    int? movieDetailsId,
  }) {
    return MovieState(
      nowPlayingMovie: nowPlayingMovie ?? this.nowPlayingMovie,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovie: popularMovie ?? this.popularMovie,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovie: topRatedMovie ?? this.topRatedMovie,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsId: movieDetailsId ?? this.movieDetailsId,
    );
  }

  @override
  List<Object> get props => [
        nowPlayingMovie,
        nowPlayingState,
        nowPlayingMessage,
        topRatedMovie,
        topRatedState,
        topRatedMessage,
        popularMovie,
        popularState,
        popularMessage,
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
      ];
}
