part of 'ui_bloc.dart';

abstract class UiEvent extends Equatable {
  const UiEvent();

  @override
  List<Object> get props => [];
}

class OnBoardingEvent extends UiEvent {
  final int currentIndex;

  const OnBoardingEvent(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}

class BottomNavigationBarCurrentIndexEvent extends UiEvent {
  final int itemCurrentIndex;

  const BottomNavigationBarCurrentIndexEvent(this.itemCurrentIndex);

  @override
  List<Object> get props => [itemCurrentIndex];
}
