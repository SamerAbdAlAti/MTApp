part of 'tv_bloc.dart';

class TvEvent extends Equatable {
  const TvEvent();

  @override
  List<Object> get props => [];
}

class GetTvTopRatedEvent extends TvEvent {}

class GetTvPopularEvent extends TvEvent {}

class GetTvDetailsEvent extends TvEvent {
  final int tvId;

  const GetTvDetailsEvent({required this.tvId});

  @override
  List<Object> get props => [tvId];
}
