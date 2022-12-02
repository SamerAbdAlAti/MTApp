part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetNowPlayingEvent extends MovieEvent {}

class GetTopRatedEvent extends MovieEvent {}

class GetPopularEvent extends MovieEvent {}

class GetMovieDetailsEvent extends MovieEvent {
  final int movieId;

  const GetMovieDetailsEvent(this.movieId);
}

class GetMovieVideosEvent extends MovieEvent {
  final int movieId;
  const GetMovieVideosEvent(this.movieId);
}


class GetControllerKeyEvent extends MovieEvent {
  final String movieKey;
  const GetControllerKeyEvent(this.movieKey);
}

