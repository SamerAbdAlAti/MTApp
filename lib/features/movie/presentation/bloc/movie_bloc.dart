import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/base_movie_use_case/base_movie_use_case.dart';

import 'package:movie/features/movie/domain/entities/movie.dart';
import 'package:movie/features/movie/domain/use_cases/get_now_playing_use_case.dart';
import 'package:movie/features/movie/domain/use_cases/get_popular_use_case.dart';
import 'package:movie/features/movie/domain/use_cases/get_top_rated_use_case.dart';
import 'package:movie/features/movie/presentation/manager/enum/unum.dart';

part 'movie_event.dart';

part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularUseCase getPopularUseCase;
  final GetTopRatedUseCase getTopRatedUseCase;
  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  MovieBloc({
    required this.getNowPlayingUseCase,
    required this.getPopularUseCase,
    required this.getTopRatedUseCase,
    required this.getMovieDetailsUseCase,
  }) : super(const MovieState()) {
    on<GetNowPlayingEvent>(getNowPlayingFunction);
    on<GetTopRatedEvent>(getTopRatedFunction);
    on<GetPopularEvent>(getPopularFunction);
    on<GetMovieDetailsEvent>(getMovieDetailsFunction);
  }

  static MovieBloc get(context) => BlocProvider.of(context);

  /// Now Playing
  Future<void> getNowPlayingFunction(GetNowPlayingEvent event, emit) async {
    final result = await getNowPlayingUseCase(const NoParameter());

    emit(state.copyWith(nowPlayingState: RequestsState.loading));
    result.fold((l) {
      emit(state.copyWith(
        nowPlayingState: RequestsState.error,
        nowPlayingMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
          nowPlayingState: RequestsState.loaded, nowPlayingMovie: r));
    });
  }

  /// Top Rated
  Future<void> getTopRatedFunction(GetTopRatedEvent event, emit) async {
    final result = await getTopRatedUseCase(const NoParameter());

    emit(state.copyWith(topRatedState: RequestsState.loading));
    result.fold((l) {
      emit(state.copyWith(
        topRatedState: RequestsState.error,
        topRatedMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
          topRatedState: RequestsState.loaded, topRatedMovie: r));
    });
  }

  /// Popular
  ///
  Future<void> getPopularFunction(GetPopularEvent event, emit) async {
    final result = await getTopRatedUseCase(const NoParameter());
    emit(state.copyWith(popularState: RequestsState.loading));
    result.fold((l) {
      emit(state.copyWith(
        popularState: RequestsState.error,
        popularMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(popularState: RequestsState.loaded, popularMovie: r));
    });
  }

  /// Movie Details
  Future<void> getMovieDetailsFunction(GetMovieDetailsEvent event, emit) async {
    final result = await getMovieDetailsUseCase(
        MovieDetailsParameter(movieId: event.movieId));
    emit(state.copyWith(movieDetailsState: RequestsState.loading));
    result.fold((l) {
      emit(state.copyWith(
          movieDetailsState: RequestsState.error,
          movieDetailsMessage: l.message));

    }, (r) {

      emit(state.copyWith(
        movieDetails: r,
        movieDetailsState: RequestsState.loaded,
      ));
    });
  }
}
