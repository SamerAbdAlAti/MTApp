import 'dart:ui';

import 'package:equatable/equatable.dart';

class AppColor extends Equatable {
  static const Color onBoardingMainColor = Color(0xff222222);
  static const Color mainColor = Color(0xfff8f8f8);

  @override
  List<Object> get props => [onBoardingMainColor, mainColor];
}
