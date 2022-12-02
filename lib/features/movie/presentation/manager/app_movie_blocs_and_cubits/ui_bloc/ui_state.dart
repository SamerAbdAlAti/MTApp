part of 'ui_bloc.dart';

class UiState extends Equatable {
  final int currentIndex;
  final int bottomNavigationBarCurrentIndex;
  final bool isShowMore;
  final int controllerYouTubeKey;
  final int itemCurrentIndexOnBoarding;

  const UiState({
    this.currentIndex = 0,
    this.bottomNavigationBarCurrentIndex = 0,
    this.isShowMore = false,
    this.controllerYouTubeKey = 0,
    this.itemCurrentIndexOnBoarding = 0,
  });

  UiState copyWith({
    int? currentIndex,
    int? bottomNavigationBarCurrentIndex,
    bool? isShowMore,
    int? controllerYouTubeKey,
    int? itemCurrentIndexOnBoarding,
  }) {
    return UiState(
      currentIndex: currentIndex ?? this.currentIndex,
      bottomNavigationBarCurrentIndex: bottomNavigationBarCurrentIndex ??
          this.bottomNavigationBarCurrentIndex,
      isShowMore: isShowMore ?? this.isShowMore,
      controllerYouTubeKey: controllerYouTubeKey ?? this.controllerYouTubeKey,
        itemCurrentIndexOnBoarding:itemCurrentIndexOnBoarding??this.itemCurrentIndexOnBoarding,
    );
  }

  @override
  List<Object> get props => [
        currentIndex,
        bottomNavigationBarCurrentIndex,
      ];
}

class CurrentIndexState extends UiState {}
