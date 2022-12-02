import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  static AppCubit get(context) => BlocProvider.of(context);

  void bottomNavigationBarCurrentIndexChange({required int index}) {
    emit(state.copyWith(bottomNavigationBarIndex: index));
  }
}
