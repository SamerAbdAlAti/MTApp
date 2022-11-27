import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/movie/presentation/manager/componants/constance.dart';

part 'ui_event.dart';

part 'ui_state.dart';

class UiBloc extends Bloc<UiEvent, UiState> {
  UiBloc() : super(const UiState()) {
    on<OnBoardingEvent>(currentIndexChange);
    on<BottomNavigationBarCurrentIndexEvent>(
        bottomNavigationBarCurrentIndexChange);
  }


  @override
  Future<void> close() {
    onBoardingController.dispose();
    topRatedPageHomeController.dispose();
    return super.close();
  }

  static UiBloc get(context) => BlocProvider.of(context);

  /// الخاص بال OnBoarding Screen
  PageController onBoardingController = PageController();

  /// الخاص بصفحة ال Home
  final topRatedPageHomeController =
      PageController(viewportFraction: 0.85);
  final bottomNavigationBarController =
      PageController(viewportFraction: 0.85, initialPage: 2);

  /// بيانات صفحة ال on Boarding
  final List<OnBoardingScreenChange> onBoardingList = [
    const OnBoardingScreenChange(
      imagePath: 'assets/images/Bitmap.png',
      title: "Get the first\nMovie &TV information",
      currentIndex: 0,
    ),
    const OnBoardingScreenChange(
      imagePath: 'assets/images/on_boarding_image_tow.png',
      title: "Know the movie\nis not worth Watching",
      currentIndex: 1,
    ),
    const OnBoardingScreenChange(
      imagePath: 'assets/images/on_boarding_image_three.png',
      title: "Real-time\nupdates movie Trailer",
      currentIndex: 2,
    ),
  ];

  void currentIndexChange(OnBoardingEvent event, emit) {
    emit(state.copyWith(currentIndex: event.currentIndex));
  }


  void bottomNavigationBarCurrentIndexChange(
      BottomNavigationBarCurrentIndexEvent event, emit) {

    emit(state.copyWith(bottomNavigationBarCurrentIndex: event.itemCurrentIndex));
  }
}
