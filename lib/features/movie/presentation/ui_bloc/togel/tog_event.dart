part of 'tog_bloc.dart';

abstract class TogEvent extends Equatable {
  const TogEvent();

  @override
  List<Object> get props => [];
}

class BottomNavigationBarCurrentIndexChangeEvent extends TogEvent {
  final int bottomCurrentIndex;

  const BottomNavigationBarCurrentIndexChangeEvent(
      {required this.bottomCurrentIndex});
}
