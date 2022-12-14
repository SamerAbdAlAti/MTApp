import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/base_movie_use_case/base_movie_use_case.dart';
import 'package:movie/features/movie/presentation/manager/enum/unum.dart';
import 'package:movie/features/tv/domain/entities/tv.dart';
import 'package:movie/features/tv/domain/use_cases/gat_tv_top_rated_use_case.dart';

part 'tv_event.dart';

part 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  final GetTvPopularUseCase getTvPopularUseCase;
  final GetTvTopRatedUseCase getTvTopRatedUseCase;
  final GetTvDetailsUseCase getTvDetailsUseCase;
  final GetTvVideosUseCase getTvVideosUseCase;
  final SearchTvUseCase searchTvUseCase;

  TvBloc({
    required this.getTvPopularUseCase,
    required this.getTvTopRatedUseCase,
    required this.getTvDetailsUseCase,
    required this.getTvVideosUseCase,
    required this.searchTvUseCase,
  }) : super(const TvState()) {
    on<GetTvTopRatedEvent>(getTvTopRated);
    on<GetTvPopularEvent>(getTvPopular);
    on<GetTvDetailsEvent>(getTvDetails);
    on<GetTvVideosEvent>(getTvVideosMethod);
    on<SearchTvEvent>(getTvBySearch);
  }

  static TvBloc get(context)=>BlocProvider.of(context);


  TextEditingController controller=TextEditingController();

  Future<void> getTvTopRated(GetTvTopRatedEvent event, Emitter emit) async {
    emit(state.copyWith(tvTopRatedState: RequestsState.loading));

    final result = await getTvTopRatedUseCase(const NoParameter());

    result.fold((l) {
      emit(state.copyWith(
        tvTopRatedState: RequestsState.error,
        tvTopRatedMessage: l.message,
      ));
    }, (r) {
      emit(
          state.copyWith(tvTopRated: r, tvTopRatedState: RequestsState.loaded));
    });
  }

  Future<void> getTvPopular(GetTvPopularEvent event, Emitter emit) async {
    emit(state.copyWith(tvPopularState: RequestsState.loading));
    final result = await getTvPopularUseCase(const NoParameter());
    result.fold((l) {
      emit(state.copyWith(
        tvPopularState: RequestsState.error,
        tvPopularMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(tvPopular: r, tvPopularState: RequestsState.loaded));
    });
  }

  Future<void> getTvDetails(GetTvDetailsEvent event, Emitter emit) async {
    emit(state.copyWith(tvDetailsState: RequestsState.loading));
    final result =
        await getTvDetailsUseCase(TvDetailsParameter(tvId: event.tvId));

    result.fold((l) {
      emit(state.copyWith(
        tvDetailsState: RequestsState.error,
        tvDetailsMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
          getTvDetails: r, tvDetailsState: RequestsState.loaded));
    });
  }

  Future<void> getTvVideosMethod(GetTvVideosEvent event, Emitter emit) async {
    emit(state.copyWith(tvVideosState: RequestsState.loading));
    final result =
        await getTvVideosUseCase(TvVideosParameter(tvId: event.tvId));

    result.fold((l) {
      emit(state.copyWith(
        tvVideosState: RequestsState.error,
        tvVideosMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        getTvVideos: r,
        tvVideosState: RequestsState.loaded,
      ));
    });
  }

  Future<void> getTvBySearch(SearchTvEvent event, Emitter emit) async {
    emit(state.copyWith(tvSearchState: RequestsState.loading));

    final result = await searchTvUseCase(SearchTvParameter(query: event.query));

    result.fold((l) {
      emit(state.copyWith(
        tvSearchState: RequestsState.error,
        tvSearchMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(tvSearch: r, tvSearchState: RequestsState.loaded));
    });
  }
}
