part of 'now_playing_list_screen.dart';

class PopularListScreen extends StatelessWidget {
  const PopularListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Scaling.scaling(context);
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (p, c) => p.popularState != c.popularState,
      builder: (context, state) {
        switch (state.popularState) {
          case RequestsState.loading:
            {
              return Center(
                child: SizedBox(
                  height: Scaling.S(250),
                  width: Scaling.screenW,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xfff99f00),
                    ),
                  ),
                ),
              );
            }
          // TODO: Handle this case.
          case RequestsState.loaded:
            {
              return Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(Scaling.S(20))
                        .copyWith(top: 0.0, bottom: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);

                                    /// TODO: Back
                                  },
                                  icon: SvgPicture.asset(
                                    backTopIcon,
                                    height: Scaling.S(30),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Back',
                              style: TextStyle(
                                fontFamily: 'SFProDisplay-Regular',
                                fontSize: Scaling.S(20),
                                color: const Color(0xff222222),
                              ),
                              softWrap: false,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Scaling.H(20),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Popular list',
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay-Semibold',
                                    fontSize: Scaling.S(20),
                                    color: const Color(0xff666666),
                                    letterSpacing: -0.125,
                                  ),
                                  softWrap: false,
                                ),
                                IntrinsicGridView.vertical(
                                  padding: EdgeInsets.only(
                                    top: Scaling.S(16),
                                    bottom: Scaling.S(12),
                                    left: Scaling.S(0),
                                    right: Scaling.S(0),
                                  ),
                                  // columnCount: 3,

                                  verticalSpace: Scaling.S(10),
                                  horizontalSpace: Scaling.S(10),

                                  children: List.generate(
                                      state.popularMovie.length, (index) {
                                    Movie model = state.popularMovie[index];
                                    return BuildPopularList(
                                      height: Scaling.S(250),
                                      width: Scaling.S(160),


                                      model: model,onTap: () async {
                                      /// TODO: Get Movie Details
                                      WidgetsFlutterBinding.ensureInitialized();
                                      context.read<MovieBloc>().add(
                                          GetMovieDetailsEvent(state
                                              .popularMovie[index].id));
                                      /// TODO: Get Movie Videos
                                      context.read<MovieBloc>().add(
                                          GetMovieVideosEvent(state
                                              .popularMovie[index].id));
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
                                    }
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
              // TODO: Handle this case.
            }
          case RequestsState.error:
            {
              return Container();
            }
        }
      },
    );
  }
}
