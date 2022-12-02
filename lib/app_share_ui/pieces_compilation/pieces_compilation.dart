import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/app_cubit/app_cubit.dart';
import 'package:movie/features/movie/presentation/manager/app_movie_blocs_and_cubits/ui_bloc/ui_bloc.dart';
import 'package:movie/features/movie/presentation/pages/movie_home_screen/movie_home_screen.dart';
import 'package:movie/features/movie/presentation/widgets/now_playing_section.dart';
import 'package:movie/features/tv/presentation/pages/tv_screen.dart';

class PiecesCompilation extends StatelessWidget {
  const PiecesCompilation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Bottom Navigation Bar
      ///
      bottomNavigationBar: const BottomNavigationBarBuild(),

      body: BlocBuilder<AppCubit, AppState>(
        buildWhen: (c, p) =>
            c.bottomNavigationBarIndex != p.bottomNavigationBarIndex,
        builder: (context, state) {
          return buildPagesForScreens()[state.bottomNavigationBarIndex];
        },
      ),
    );
  }
}

List<Widget> buildPagesForScreens() => [
      const MovieHomeScreen(),
      const TvScreen(),
      Container(),
    ];
