part of 'ui_bloc.dart';

class UiState extends Equatable {
  final int currentIndex;

  const UiState({
    this.currentIndex = 0,
  });

  @override
  List<Object> get props => [currentIndex];
}
