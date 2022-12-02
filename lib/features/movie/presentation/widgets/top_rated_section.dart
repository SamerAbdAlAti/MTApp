part of 'now_playing_section.dart';

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
                  return Center(
                    child: SizedBox(
                      height: Scaling.S(170),
                      width: Scaling.screenW,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xfff99f00),
                        ),
                      ),
                    ),
                  );
                }
              case RequestsState.loaded:
                {
                  return SizedBox(
                      height: Scaling.S(170),
                      width: Scaling.screenW,
                      child: PageView(
                        controller: uiBloc.topRatedPageHomeController,
                        children: List.generate(
                            stateTow.topRatedMovie.length,
                            (index) => buildOnBoardingToHome(
                                    stateTow.topRatedMovie[index],
                                    onTap: () async {
                                  /// TODO: Get Movie Details
                                  WidgetsFlutterBinding.ensureInitialized();
                                  context.read<MovieBloc>().add(
                                      GetMovieDetailsEvent(
                                          stateTow.topRatedMovie[index].id));

                                  /// TODO: Get Movie Videos
                                  context.read<MovieBloc>().add(
                                      GetMovieVideosEvent(
                                          stateTow.topRatedMovie[index].id));

                                  /// TODO: Make StatusBar Hidden
                                  StatusBarControl.setHidden(true,
                                      animation: StatusBarAnimation.FADE);
                                  await Navigator.push(

                                      /// TODO: Navigate To Details
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MoviesDetailsScreen(),
                                      ));
                                })),
                      ));
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
