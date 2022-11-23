import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/features/movie/data/remote/data_sources/remote_data_source.dart';
import 'package:movie/features/movie/data/remote/models/movie_model.dart';
import 'package:movie/features/movie/data/repositories/movie_repsitory.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';
import 'package:movie/features/movie/domain/repositories/base_movie_repository.dart';
import 'package:movie/features/movie/domain/use_cases/get_now_playing_use_case.dart';
import 'package:movie/features/movie/domain/use_cases/get_popular_use_case.dart';
import 'package:movie/features/movie/domain/use_cases/get_top_rated_use_case.dart';
import 'package:movie/features/movie/presentation/manager/enum/unum.dart';
import 'package:movie/features/movie/presentation/manager/services_locator/services_locator.dart';

part 'movie_event.dart';

part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularUseCase getPopularUseCase;
  final GetTopRatedUseCase getTopRatedUseCase;

  MovieBloc({
    required this.getNowPlayingUseCase,
    required this.getPopularUseCase,
    required this.getTopRatedUseCase,
  }) : super(const MovieState()) {
    on<GetNowPlayingEvent>(getNowPlayingFunction);
    on<GetTopRatedEvent>(getTopRatedFunction);
    on<GetPopularEvent>(getPopularFunction);
  }

  Future<void> getNowPlayingFunction(GetNowPlayingEvent event, emit) async {
    final result = await getNowPlayingUseCase.execute();

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

  Future<void> getTopRatedFunction(GetTopRatedEvent event, emit) async {
    final result = await getTopRatedUseCase.execute();

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

  Future<void> getPopularFunction(GetPopularEvent event, emit) async {
    final result = await getPopularUseCase.execute();

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
}
