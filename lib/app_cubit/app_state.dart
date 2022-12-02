part of 'app_cubit.dart';

class AppState extends Equatable {
  final int bottomNavigationBarIndex;

  const AppState({
    this.bottomNavigationBarIndex = 0,
  });

  AppState copyWith({int? bottomNavigationBarIndex}) {
    return AppState(
      bottomNavigationBarIndex:
          bottomNavigationBarIndex ?? this.bottomNavigationBarIndex,
    );
  }

  @override
  List<Object> get props => [bottomNavigationBarIndex];
}
