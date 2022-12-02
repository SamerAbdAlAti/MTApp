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

  final List<MovieVideos> movieVideos;
  final RequestsState movieVideosState;
  final String movieVideosMessage;

  final String youTubeUrl;
  final RequestsState youTubeState;
  final String videoKey;

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
    this.movieVideos = const [],
    this.movieVideosMessage = '',
    this.movieVideosState = RequestsState.loading,
    this.youTubeUrl = 'tnLx7mif5Vc',
    this.youTubeState = RequestsState.loaded,
    this.videoKey = '',
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
    List<MovieVideos>? movieVideos,
    RequestsState? movieVideosState,
    String? movieVideosMessage,
    String? youTubeUrl,
    RequestsState? youTubeState,
    String? videoKey,
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
      movieVideos: movieVideos ?? this.movieVideos,
      movieVideosMessage: movieVideosMessage ?? this.movieVideosMessage,
      movieVideosState: movieVideosState ?? this.movieVideosState,
      youTubeState: youTubeState ?? this.youTubeState,
      youTubeUrl: youTubeUrl ?? this.youTubeUrl,
      videoKey: videoKey ?? this.videoKey,
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
        movieVideos,
        movieVideosState,
        movieVideosMessage,
      ];
}
