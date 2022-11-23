import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie/features/movie/presentation/manager/enum/unum.dart';
import 'package:movie/features/movie/presentation/pages/movie_home_screen/movie_home_screen.dart';
import 'package:movie/features/movie/presentation/ui_bloc/ui_bloc.dart';
import 'package:size_builder/size_builder.dart';

class TopRatedSection extends StatelessWidget {
  const TopRatedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UiBloc, UiState>(
      builder: (context, stateOne) {
        UiBloc uiBloc = UiBloc.get(context);

        return BlocBuilder<MovieBloc, MovieState>(
          buildWhen: (previous, current) =>
              previous.topRatedState != current.topRatedState,
          builder: (context, stateTow) {
            Scaling.scaling(context);
            switch (stateTow.topRatedState) {

              case RequestsState.loading:
                {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xfff99f00),
                    ),
                  );
                }
              case RequestsState.loaded:
                {
                 return SizedBox(
                    height: Scaling.S(170),
                    width: Scaling.screenW,
                    child: PageView.builder(
                      controller: uiBloc.topRatedPageHomeController,
                      itemCount: stateTow.topRatedMovie.length,
                      itemBuilder: (context, index) {
                        return buildOnBoardingToHome(
                            stateTow.topRatedMovie[index]);
                      },
                    ),
                  );
                }
              case RequestsState.error:

                {
                  return Container();
                }
            }

          },
        );
      },
    );
  }
}
