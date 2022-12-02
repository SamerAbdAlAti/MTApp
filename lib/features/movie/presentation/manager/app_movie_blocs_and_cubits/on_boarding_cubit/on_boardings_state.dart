part of 'on_boardings_cubit.dart';

 class OnBoardingsState extends Equatable {
  final int onBoardingItemCurrentIndex;

  const OnBoardingsState({this.onBoardingItemCurrentIndex=0});

  @override
  List<Object?> get props => [onBoardingItemCurrentIndex];
}

