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
  ];
}
