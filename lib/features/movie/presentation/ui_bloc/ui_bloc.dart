import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ui_event.dart';

part 'ui_state.dart';

class UiBloc extends Bloc<UiEvent, UiState> {
  UiBloc() : super(const UiState()) {
    on(currentIndexChange);
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
  PageController topRatedPageHomeController = PageController(
    viewportFraction: 0.85,
    initialPage:2
  );


  void currentIndexChange(OnBoardingEvent event, emit) {
    emit(UiState(currentIndex: event.currentIndex));
  }
}
