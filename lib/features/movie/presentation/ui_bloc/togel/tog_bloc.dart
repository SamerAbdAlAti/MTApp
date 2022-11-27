import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tog_event.dart';

part 'tog_state.dart';

class TogBloc extends Bloc<TogEvent, TogState> {
  TogBloc() : super(const TogState()) {
    on<BottomNavigationBarCurrentIndexChangeEvent>(bottomNavigationBarCurrentIndexMethod);
  }

  Future<void> bottomNavigationBarCurrentIndexMethod(
      BottomNavigationBarCurrentIndexChangeEvent event, emit) async {
    emit(state.copyWith(itemCurrentIndex: event.bottomCurrentIndex));
  }
}
