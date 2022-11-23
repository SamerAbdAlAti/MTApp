import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie/features/movie/presentation/manager/shear/app_color.dart';

class AppStyle extends Equatable {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.mainColor,
  );
  static ThemeData darkTheme = ThemeData();

  @override
  List<Object> get props => [lightTheme, darkTheme];
}
