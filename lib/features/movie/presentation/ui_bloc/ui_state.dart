part of 'ui_bloc.dart';

class UiState extends Equatable {
  final int currentIndex;
  final int bottomNavigationBarCurrentIndex;


  const UiState({
    this.currentIndex = 0,
    this.bottomNavigationBarCurrentIndex = 0,
  });

  UiState copyWith({
    int? currentIndex,
    int? bottomNavigationBarCurrentIndex,
  }) {
    return UiState(
      currentIndex: currentIndex ?? this.currentIndex,
      bottomNavigationBarCurrentIndex: bottomNavigationBarCurrentIndex ??
          this.bottomNavigationBarCurrentIndex,
    );
  }

  @override
  List<Object> get props => [
        currentIndex,
        bottomNavigationBarCurrentIndex,
      ];
}
