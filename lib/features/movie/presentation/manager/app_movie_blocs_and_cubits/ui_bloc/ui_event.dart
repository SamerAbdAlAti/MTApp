part of 'ui_bloc.dart';

abstract class UiEvent extends Equatable {
  const UiEvent();

  @override
  List<Object> get props => [];
}



class ShowMoreEvent extends UiEvent {}

class GetControllerKeyYouTubeEvent extends UiEvent {
  final int controllerKey;

  const GetControllerKeyYouTubeEvent({required this.controllerKey});
}

class OnBoardingItemCurrentIndexEvent extends UiEvent {
  final int itemCurrentIndexOnBoarding;

  const OnBoardingItemCurrentIndexEvent({required this.itemCurrentIndexOnBoarding});

  @override
  List<Object> get props => [itemCurrentIndexOnBoarding];
}
