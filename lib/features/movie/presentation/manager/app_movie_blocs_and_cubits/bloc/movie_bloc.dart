import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
  final GetMovieVideosUseCase getMovieVideosUseCase;
  final MovieSearchUseCase movieSearchUseCase;

  MovieBloc({
    required this.getNowPlayingUseCase,
    required this.getPopularUseCase,
    required this.getTopRatedUseCase,
    required this.getMovieDetailsUseCase,
    required this.getMovieVideosUseCase,
    required this.movieSearchUseCase,
  }) : super(const MovieState()) {
    on<GetNowPlayingEvent>(getNowPlayingFunction);
    on<GetTopRatedEvent>(getTopRatedFunction);
    on<GetPopularEvent>(getPopularFunction);
    on<GetMovieDetailsEvent>(getMovieDetailsFunction);
    on<GetMovieVideosEvent>(getMovieVideosFunction);
    on<SearchMovieEvent>(searchMovieMethod);
  }

  @override
  Future<void> close() {
    popularController.dispose();
    return super.close();
  }

  TextEditingController controller = TextEditingController();
  final ScrollController popularController = ScrollController();
  final ScrollController nawPlayingController = ScrollController();

  static MovieBloc get(context) => BlocProvider.of(context);

  GlobalKey videoKeyOne = GlobalKey<ScaffoldState>();

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
    final result = await getPopularUseCase(const NoParameter());
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
  ///
  Future<void> getMovieDetailsFunction(GetMovieDetailsEvent event, emit) async {
    emit(state.copyWith(movieDetailsState: RequestsState.loading));

    final result = await getMovieDetailsUseCase(
        MovieDetailsParameter(movieId: event.movieId));

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

  /// TODO: Get Movie Videos
  Future<void> getMovieVideosFunction(GetMovieVideosEvent event, emit) async {
    emit(state.copyWith(movieVideosState: RequestsState.loading));
    final results = await getMovieVideosUseCase(
        MovieVideosParameter(movieId: event.movieId));
    results.fold((l) {
      emit(state.copyWith(
        movieVideosState: RequestsState.error,
        movieVideosMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        movieVideos: r,
        movieVideosState: RequestsState.loaded,
      ));
    });
  }

  Future<void> searchMovieMethod(SearchMovieEvent event, Emitter emit) async {
    emit(state.copyWith(searchMovieState: RequestsState.loading));

    final result =
        await movieSearchUseCase(MovieSearchParameter(query: event.query));
    result.fold((l) {
      emit(state.copyWith(
        searchMovieState: RequestsState.error,
        searchMovieMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        searchMovie: r,
        searchMovieState: RequestsState.loaded,
      ));
    });
  }


}
