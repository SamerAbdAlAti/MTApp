import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie/features/movie/presentation/manager/shear/app_color.dart';

class AppStyle extends Equatable {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.mainColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.mainColor,
      elevation: 0.0,
    ),
  );
  static ThemeData darkTheme = ThemeData();

  @override
  List<Object> get props => [lightTheme, darkTheme];
}
