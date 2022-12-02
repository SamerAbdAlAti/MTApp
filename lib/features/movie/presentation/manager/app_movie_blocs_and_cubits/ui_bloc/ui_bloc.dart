import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/movie/presentation/manager/componants/constance.dart';

part 'ui_event.dart';

part 'ui_state.dart';

class UiBloc extends Bloc<UiEvent, UiState> {
  UiBloc() : super(const UiState()) {
    on<OnBoardingItemCurrentIndexEvent>(onBoardingItemCurrentIndexMethod);

    on<ShowMoreEvent>(showMoreTextChange);
    on<GetControllerKeyYouTubeEvent>(getControllerKey);
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
  final topRatedPageHomeController = PageController(viewportFraction: 0.85);
  final bottomNavigationBarController =
      PageController(viewportFraction: 0.85, initialPage: 2);

  /// TODO: Change itemCurrentIndex For Bottom Navigation Bar

  bool isShowMore = false;

  Future<void> showMoreTextChange(
      ShowMoreEvent event, Emitter<UiState> emit) async {
    isShowMore = !isShowMore;
    emit(const UiState());
  }

  int currentIndex = 0;

  void getControllerKey(
      GetControllerKeyYouTubeEvent event, Emitter<UiState> emit) {
    currentIndex = event.controllerKey;
    emit(state.copyWith(controllerYouTubeKey: event.controllerKey));
    emit(CurrentIndexState());
  }

  var bottomSheetGetDetailsN = GlobalKey<ScaffoldState>();

  /// TODO: Change Current Index For Page View

  void onBoardingItemCurrentIndexMethod(
      OnBoardingItemCurrentIndexEvent event, Emitter emit) {
    emit(state.copyWith(
        itemCurrentIndexOnBoarding: event.itemCurrentIndexOnBoarding));
  }
}
