part of 'tog_bloc.dart';

class TogState extends Equatable {
  final int itemCurrentIndex;

  const TogState({
    this.itemCurrentIndex = 0,
  });

  TogState copyWith({
    int? itemCurrentIndex,
  }) {
    return TogState(
      itemCurrentIndex: itemCurrentIndex ?? this.itemCurrentIndex,
    );
  }

  @override
  List<Object> get props => [itemCurrentIndex];
}
