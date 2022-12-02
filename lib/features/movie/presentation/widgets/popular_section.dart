part of 'now_playing_section.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (context, stateTow) {
        Scaling.scaling(context);
        switch (stateTow.popularState) {
          case RequestsState.loading:
            {
              return Center(
                child: SizedBox(
                  height: Scaling.S(400),
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
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(Scaling.S(20)).copyWith(top: 0),
                    child: Row(
                      children: [
                        Text(
                          'Popular',
                          style: TextStyle(
                            fontFamily: 'SFProDisplay-Bold',
                            fontSize: Scaling.S(18),
                            color: const Color(0xff666666),
                          ),
                          softWrap: false,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Scaling.S(500),
                    width: Scaling.screenW,
                    child: IntrinsicGridView.horizontal(


                      padding: EdgeInsets.only(
                        top: Scaling.S(16),
                        bottom: Scaling.S(12),
                        left: Scaling.S(12),
                        right: Scaling.S(12),
                      ),
                      // columnCount: 3,

                      verticalSpace: Scaling.S(10),
                      horizontalSpace: Scaling.S(10),

                      children: List.generate(
                        stateTow.popularMovie.length-10,
                        (index) {
                          Movie model = stateTow.popularMovie[index];

                          return index == stateTow.popularMovie.length - 11
                              ? InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const PopularListScreen()));
                            },
                                child: Column(
                                    children: [
                                      Container(
                                        height: Scaling.S(210),
                                        width: Scaling.S(140),
                                        decoration: BoxDecoration(
                                          color: const Color(0xfffecb2f),
                                          borderRadius:
                                              BorderRadius.circular(Scaling.S(6)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0xffc2a650),
                                              offset: Offset(0, Scaling.S(5)),
                                              blurRadius: Scaling.S(6),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            'MORE',
                                            style: TextStyle(
                                              fontFamily: 'SFProDisplay-Medium',
                                              fontSize: Scaling.S(20),
                                              color: const Color(0xffffffff),
                                            ),
                                            textAlign: TextAlign.center,
                                            softWrap: false,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              )
                              : BuildPopularList(model: model,onTap: () async {
                            /// TODO: Get Movie Details
                            WidgetsFlutterBinding.ensureInitialized();
                            context.read<MovieBloc>().add(
                                GetMovieDetailsEvent(stateTow
                                    .popularMovie[index].id));
                            /// TODO: Get Movie Videos
                            context.read<MovieBloc>().add(
                                GetMovieVideosEvent(stateTow
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
                          });
                        },
                      ),
                    ),
                  ),
                ],
              );
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
