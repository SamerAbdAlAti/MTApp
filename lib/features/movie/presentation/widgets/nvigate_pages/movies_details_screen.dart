import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:movie/core/uteils/app_constance.dart';
import 'package:movie/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie/features/movie/presentation/manager/enum/unum.dart';
import 'package:movie/features/movie/presentation/manager/shear/app_string_componts.dart';
import 'package:size_builder/size_builder.dart';

class MoviesDetailsScreen extends StatelessWidget {
  const MoviesDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Scaling.scaling(context);
    return Scaffold(
      body: BlocConsumer<MovieBloc, MovieState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.movieDetailsState) {
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

            case RequestsState.loaded:
            {
              return Column(
                children: [
                  Stack(
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
                                imageUrl: AppConstance.imageCompletePathUrl(
                                  path: state.movieDetails.posterPath!,
                                ),
                                alignment: Alignment.topCenter,
                                color: Colors.black.withOpacity(0.3),
                                colorBlendMode: BlendMode.darken,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: double.maxFinite,
                              width: double.maxFinite,
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/icons/start_play_icon.svg",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: double.maxFinite,
                              width: double.maxFinite,
                              child: Padding(
                                padding: EdgeInsets.only(left: Scaling.S(180)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.movieDetails.title,
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay-Bold',
                                        fontSize: Scaling.S(20),
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                      softWrap: false,
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
                      SafeArea(
                        child: Row(
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
                                    color: Colors.white,
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
                          padding: EdgeInsets.only(left: Scaling.S(20)),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    height: Scaling.S(188),
                                    width: Scaling.S(120),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius:
                                      BorderRadius.circular(Scaling.S(5)),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29242121),
                                          offset: Offset(0, 10),
                                          blurRadius: 6,
                                        ),
                                      ],
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: AppConstance.imageCompletePathUrl(
                                        path: state.movieDetails.backdropPath!,
                                      ),

                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: Scaling.S(20))
                                    .copyWith(right: 0.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: Scaling.S(188 / 2),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: Scaling.S(15),
                                          ),
                                          Text(
                                            "${state.movieDetails.popularity!.round()} People wathing",
                                            style: TextStyle(
                                              color: const Color(0xff222222),
                                              fontSize: Scaling.S(15),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Scaling.S(5),
                                          ),
                                          SizedBox(
                                            height: Scaling.S(25),
                                            width: Scaling.screenW! - 188 + 20,
                                            child: IntrinsicGridView.horizontal(
                                              rowCount: 1,
                                              children: List.generate(10, (index) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      left: index == 0 ? 0.0 : 5),
                                                  child: Text(
                                                    "Action,",
                                                    style: TextStyle(
                                                      color:
                                                      const Color(0xff222222),
                                                      fontSize: Scaling.S(15),
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
                                                '9',
                                                style: TextStyle(
                                                  fontFamily: 'SFProDisplay-Medium',
                                                  fontSize: Scaling.S(20),
                                                  color: const Color(0xffd6182a),
                                                ),
                                                softWrap: false,
                                              ),
                                              Text(
                                                '.8',
                                                style: TextStyle(
                                                  fontFamily:
                                                  'SFProDisplay-Regular',
                                                  fontSize: Scaling.S(12),
                                                  color: const Color(0xffd6182a),
                                                ),
                                                softWrap: false,
                                              ),
                                              SizedBox(
                                                width: Scaling.S(13),
                                              ),
                                              Row(
                                                children: List.generate(5, (index) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        right: Scaling.S(10)),
                                                    child: SvgPicture.asset(
                                                        "assets/icons/vote_avarage_stare_icon.svg"),
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
                ],
              );
            }
            case RequestsState.error:
            return Container();
          }

        },
      ),
    );
  }
}
