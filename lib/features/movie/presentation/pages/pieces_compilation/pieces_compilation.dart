import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/movie/presentation/pages/movie_home_screen/movie_home_screen.dart';
import 'package:movie/features/movie/presentation/ui_bloc/ui_bloc.dart';
import 'package:movie/features/movie/presentation/widgets/now_playing_section.dart';

class PiecesCompilation extends StatelessWidget {
  const PiecesCompilation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UiBloc, UiState>(
      builder: (context, state) {
        return Scaffold(

          /// Bottom Navigation Bar
          ///
          bottomNavigationBar: const BottomNavigationBarBuild(),
          body: buildPagesForScreens()[state.bottomNavigationBarCurrentIndex],

        );
      },
    );
  }
}

List<Widget> buildPagesForScreens() =>
    [
      const MovieHomeScreen(),
      Container(
        color: Colors.deepOrange,
      ),
      Container(),
    ];


