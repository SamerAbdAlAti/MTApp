part of 'tv_top_rated_section.dart';

class TvPopularSection extends StatelessWidget {
  const TvPopularSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      buildWhen: (c, p) => c.tvPopularState != p.tvPopularState,
      builder: (context, state) {
        switch (state.tvPopularState) {
          case RequestsState.loading:
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
          // TODO: Handle this case.

          case RequestsState.loaded:
            return Column(
              children: List.generate(state.tvPopular.length, (index) {
                Tv model = state.tvPopular[index];
                return index >= 6
                    ? Container()
                    : index == 5
                        ? InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TvPopularList(
                                        list: state.tvPopular,
                                      )));
                            },
                            child: GestureDetector(
                              onTap: (){

                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: Scaling.S(10),
                                  ),
                                  Container(
                                    height: Scaling.S(160),
                                    width: double.maxFinite,
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
                            ),
                          )
                        : GestureDetector(
                  onTap: (){
                    StatusBarControl.setHidden(true,animation: StatusBarAnimation.FADE);
                    context.read<TvBloc>().add(GetTvDetailsEvent(tvId: state.tvPopular[index].id));
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const TvDetailsScreen()));
                  },
                          child: Padding(
                              padding: EdgeInsets.all(Scaling.S(20)).copyWith(
                                  right: 0.0, left: 0.0, bottom: Scaling.S(5)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.topEnd,
                                    children: [
                                      Container(
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        height: Scaling.S(160),
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Scaling.S(8.0)),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              AppConstance.imageCompletePathUrl(
                                                  path: model.posterPath),
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                            baseColor: Colors.grey[850]!,
                                            highlightColor: Colors.grey[800]!,
                                            child: Container(
                                              height: Scaling.S(300),
                                              width: Scaling.S(120),
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(
                                            Icons.error,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(Scaling.S(10)),
                                        child: Container(
                                          height: Scaling.S(40),
                                          width: Scaling.S(40),
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment(0.0, -1.0),
                                              end: Alignment(0.0, 1.0),
                                              colors: [
                                                Color(0xfff99f00),
                                                Color(0xffdb3069)
                                              ],
                                              stops: [0.0, 1.0],
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.elliptical(
                                                    9999.0, 9999.0)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                model.voteAverage
                                                    .toString()
                                                    .substring(0, 1),
                                                style: TextStyle(
                                                  fontFamily:
                                                      'SFProDisplay-Medium',
                                                  fontSize: Scaling.S(20),
                                                  color: const Color(0xffffffff),
                                                ),
                                                softWrap: false,
                                              ),
                                              Text(
                                                '.${model.voteAverage.toString().substring(2, 3)}',
                                                style: TextStyle(
                                                  fontFamily:
                                                      'SFProDisplay-Regular',
                                                  fontSize: Scaling.S(12),
                                                  color: const Color(0xffffffff),
                                                ),
                                                softWrap: false,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Scaling.S(15),
                                  ),
                                  Text(
                                    model.name,
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay-Bold',
                                      fontSize: Scaling.S(15),
                                      color: const Color(0xff222222),
                                    ),
                                    softWrap: false,
                                  ),
                                ],
                              ),
                            ),
                        );
              }),
            );
            // TODO: Handle this case.
            break;
          case RequestsState.error:
            return Container();
            // TODO: Handle this case.
            break;
        }
      },
    );
  }
}
