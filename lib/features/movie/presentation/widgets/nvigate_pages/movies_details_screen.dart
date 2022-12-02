import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:movie/core/uteils/app_constance.dart';
import 'package:movie/features/movie/presentation/manager/app_movie_blocs_and_cubits/bloc/movie_bloc.dart';
import 'package:movie/features/movie/presentation/manager/app_movie_blocs_and_cubits/ui_bloc/ui_bloc.dart';
import 'package:movie/features/movie/presentation/manager/enum/unum.dart';
import 'package:movie/features/movie/presentation/manager/shear/app_string_componts.dart';
import 'package:movie/features/movie/presentation/widgets/video_player/youtube_player_bottom_seet.dart';
import 'package:shimmer/shimmer.dart';
import 'package:size_builder/size_builder.dart';
import 'package:status_bar_control/status_bar_control.dart';

class MoviesDetailsScreen extends StatelessWidget {
  const MoviesDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Scaling.scaling(context);
    return WillPopScope(
      onWillPop: () => backDetailsScreen(context),
      child: Scaffold(
        body: BlocBuilder<UiBloc, UiState>(
          builder: (context, stateTow) {
            UiBloc uiBloc = UiBloc.get(context);
            return BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                MovieBloc movieBloc = MovieBloc.get(context);
                switch (state.movieDetailsState) {
                  case RequestsState.loading:
                    {
                      return Scaffold(
                        key: movieBloc.videoKeyOne,
                        body: Center(
                          child: SizedBox(
                            height: Scaling.S(250),
                            width: Scaling.screenW,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xfff99f00),
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                  case RequestsState.loaded:
                    {
                      return Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: Scaling.S(280),
                                            width: Scaling.screenW,
                                            child: Stack(
                                              children: [
                                                SizedBox(
                                                  height: double.maxFinite,
                                                  width: double.maxFinite,
                                                  child: CachedNetworkImage(
                                                    imageUrl: AppConstance
                                                        .imageCompletePathUrl(
                                                      path: state.movieDetails
                                                          .posterPath!,
                                                    ),
                                                    alignment:
                                                        Alignment.topCenter,
                                                    color: Colors.black
                                                        .withOpacity(0.3),
                                                    colorBlendMode:
                                                        BlendMode.darken,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: double.maxFinite,
                                                  width: double.maxFinite,
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      /// TODO: Show Bottom Sheet For Show Videos
                                                      showModalBottomSheet(
                                                          context: context,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .vertical(
                                                              top: Radius
                                                                  .circular(
                                                                Scaling.S(20),
                                                              ),
                                                            ),
                                                          ),
                                                          builder: (context) {
                                                            return const YouTubePlayerBottomSheet();
                                                          });
                                                    },
                                                    child: Center(
                                                      child: SvgPicture.asset(
                                                        "assets/icons/start_play_icon.svg",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: double.maxFinite,
                                                  width: double.maxFinite,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: Scaling.S(180)),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          state.movieDetails
                                                              .title,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'SFProDisplay-Bold',
                                                            fontSize:
                                                                Scaling.S(20),
                                                            color: const Color(
                                                                0xffffffff),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          softWrap: true,
                                                        ),
                                                        SizedBox(
                                                          height: Scaling.S(12),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SafeArea(
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                clipBehavior: Clip.antiAlias,
                                                width: Scaling.S(50),
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.elliptical(
                                                              9999.0, 9999.0)),
                                                ),
                                                child: MaterialButton(
                                                  onPressed: () async {
                                                    WidgetsFlutterBinding
                                                        .ensureInitialized();
                                                    StatusBarControl.setColor(
                                                        Colors.white
                                                            .withOpacity(0.0));
                                                    StatusBarControl.setHidden(
                                                        false,
                                                        animation:
                                                            StatusBarAnimation
                                                                .FADE);
                                                    StatusBarControl.setStyle(StatusBarStyle.DARK_CONTENT);

                                                    /// TODO: Back
                                                    Navigator.pop(context);
                                                  },
                                                  child: SvgPicture.asset(
                                                    backTopIcon,
                                                    color: Colors.white,
                                                    height: Scaling.S(30),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Back',
                                            style: TextStyle(
                                              fontFamily:
                                                  'SFProDisplay-Regular',
                                              fontSize: Scaling.S(20),
                                              color: Colors.white,
                                            ),
                                            softWrap: false,
                                          ),
                                          const Spacer(),
                                          SvgPicture.asset(
                                            "assets/icons/share_icon_details.svg",
                                          ),
                                          SizedBox(
                                            width: Scaling.S(20),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: Scaling.screenW,
                                      height: Scaling.S(280 + (188 / 2)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: Scaling.S(20)),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  clipBehavior: Clip.antiAlias,
                                                  height: Scaling.S(188),
                                                  width: Scaling.S(120),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffffffff),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Scaling.S(5)),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            Color(0xa14b4949),
                                                        offset: Offset(2, 6),
                                                        blurRadius: 3,
                                                      ),
                                                    ],
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl: AppConstance
                                                        .imageCompletePathUrl(
                                                      path: state.movieDetails
                                                          .backdropPath!,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                      horizontal: Scaling.S(20))
                                                  .copyWith(right: 0.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    width: Scaling.screenW! -
                                                        Scaling.S(160),
                                                    height: Scaling.S(188 / 2),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: Scaling.S(15),
                                                        ),
                                                        Text(
                                                          "${state.movieDetails.popularity!.round()} People wathing",
                                                          style: TextStyle(
                                                            color: const Color(
                                                                0xff222222),
                                                            fontSize:
                                                                Scaling.S(15),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: Scaling.S(5),
                                                        ),
                                                        SizedBox(
                                                          height: Scaling.S(25),
                                                          width:
                                                              Scaling.screenW! -
                                                                  188 +
                                                                  22,
                                                          child:
                                                              IntrinsicGridView
                                                                  .horizontal(
                                                            rowCount: 1,
                                                            children: List.generate(
                                                                state
                                                                    .movieDetails
                                                                    .genres!
                                                                    .length,
                                                                (index) {
                                                              return Padding(
                                                                padding: EdgeInsets.only(
                                                                    left: index ==
                                                                            0
                                                                        ? 0.0
                                                                        : 5),
                                                                child: Text(
                                                                  "${state.movieDetails.genres![index].name}${index != state.movieDetails.genres!.length - 1 ? "," : ""}",
                                                                  style:
                                                                      TextStyle(
                                                                    color: const Color(
                                                                        0xff222222),
                                                                    fontSize:
                                                                        Scaling.S(
                                                                            15),
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              state.movieDetails
                                                                  .voteAverage
                                                                  .toString()
                                                                  .substring(
                                                                      0, 1),
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'SFProDisplay-Medium',
                                                                fontSize:
                                                                    Scaling.S(
                                                                        20),
                                                                color: const Color(
                                                                    0xffd6182a),
                                                              ),
                                                              softWrap: false,
                                                            ),
                                                            Text(
                                                              '.${state.movieDetails.voteAverage.toString().substring(2, 3)}',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'SFProDisplay-Regular',
                                                                fontSize:
                                                                    Scaling.S(
                                                                        12),
                                                                color: const Color(
                                                                    0xffd6182a),
                                                              ),
                                                              softWrap: false,
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  Scaling.S(13),
                                                            ),
                                                            Row(
                                                              children:
                                                                  List.generate(
                                                                      5,
                                                                      (index) {
                                                                return Padding(
                                                                  padding: EdgeInsets.only(
                                                                      right: Scaling
                                                                          .S(10)),
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                    "assets/icons/vote_avarage_stare_icon.svg",
                                                                    height:
                                                                        Scaling.S(
                                                                            13.21),
                                                                    color: index <=
                                                                            ((state.movieDetails.voteAverage!.round()) / 2) -
                                                                                1
                                                                        ? const Color(
                                                                            0xffd6182a)
                                                                        : const Color(
                                                                            0xffd2d2d2),
                                                                  ),
                                                                );
                                                              }),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),

                                /// TODO:---------------------------UNDER
                                ///
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        /// TODO: Show More
                                        context
                                            .read<UiBloc>()
                                            .add(ShowMoreEvent());
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(Scaling.S(20)),
                                        child: Text(
                                          state.movieDetails.overview!,
                                          maxLines: 10000,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: 'SFProDisplay-Regular',
                                            fontSize: Scaling.S(20),
                                            color: const Color(0xff666666),
                                            height: 1.4,
                                          ),
                                          textHeightBehavior:
                                              const TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Scaling.screenW,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.all(Scaling.S(20)),
                                            child: Text(
                                              'Producing Companies',
                                              style: TextStyle(
                                                fontFamily:
                                                    'SFProDisplay-Semibold',
                                                fontSize: Scaling.S(15),
                                                color: const Color(0xff666666),
                                                letterSpacing: -0.09375,
                                              ),
                                              softWrap: false,
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: List.generate(
                                                  state
                                                      .movieDetails
                                                      .productionCompanies!
                                                      .length, (index) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      left: Scaling.S(20)),
                                                  child: Column(children: [
                                                    Container(
                                                      height: Scaling.S(102),
                                                      width: Scaling.S(70),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    Scaling.S(
                                                                        5)),
                                                      ),
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      child: CachedNetworkImage(
                                                        cacheManager:
                                                            CacheManager(Config(
                                                                'customKey1',
                                                                stalePeriod:
                                                                    const Duration(
                                                                        days:
                                                                            7))),
                                                        fit: BoxFit.contain,
                                                        imageUrl: AppConstance
                                                            .imageCompletePathUrl(
                                                                path: state
                                                                        .movieDetails
                                                                        .productionCompanies![
                                                                            index]
                                                                        .logoPath ??
                                                                    ""),
                                                        placeholder: (context,
                                                                url) =>
                                                            Shimmer.fromColors(
                                                          baseColor:
                                                              Colors.grey[850]!,
                                                          highlightColor:
                                                              Colors.grey[800]!,
                                                          child: Container(
                                                            height:
                                                                Scaling.S(300),
                                                            width:
                                                                Scaling.S(120),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            const Icon(
                                                          Icons.error,
                                                          color: Colors.black12,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: Scaling.S(5),
                                                    ),
                                                    SizedBox(
                                                      width: Scaling.S(70),
                                                      child: Text(
                                                        state
                                                            .movieDetails
                                                            .productionCompanies![
                                                                index]
                                                            .name,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'SFProDisplay-Medium',
                                                          fontSize:
                                                              Scaling.S(12),
                                                          color: const Color(
                                                              0xff222222),
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        softWrap: true,
                                                      ),
                                                    ),
                                                  ]),
                                                );
                                              }),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  case RequestsState.error:
                    return Container();
                }
              },
            );
          },
        ),
      ),
    );
  }
}

Future<bool> backDetailsScreen(BuildContext context) async {
  StatusBarControl.setColor(Colors.white.withOpacity(0.0));
  StatusBarControl.setHidden(false, animation: StatusBarAnimation.FADE);
  StatusBarControl.setStyle(StatusBarStyle.DARK_CONTENT);
  Navigator.of(context).pop(true);
  return true;
}
