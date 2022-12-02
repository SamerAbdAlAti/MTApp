import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/uteils/app_constance.dart';
import 'package:movie/features/movie/presentation/manager/shear/app_string_componts.dart';
import 'package:movie/features/tv/presentation/blocs_and_cubits/tv_bloc/tv_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:size_builder/size_builder.dart';
import 'package:status_bar_control/status_bar_control.dart';

class TvDetailsScreen extends StatelessWidget {
  const TvDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      builder: (context, state) {
        print(state.tvTopRated);
        Scaling.scaling(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: Scaling.S(540),
                      width: Scaling.screenW,
                      child: CachedNetworkImage(
                        imageUrl: AppConstance.imageCompletePathUrl(
                          path: state.getTvDetails.posterPath ??
                              state.getTvDetails.backDroPath!,
                        ),
                        color: Colors.black.withOpacity(0.1),
                        colorBlendMode: BlendMode.darken,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[200]!,
                          highlightColor: Colors.grey[200]!,
                          child: Container(
                            height: Scaling.S(300),
                            width: Scaling.S(120),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: Scaling.S(540),
                      width: Scaling.screenW,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, -0.985),
                          end: Alignment(0.066, 0.763),
                          colors: [Color(0x00000000), Color(0xff000000)],
                          stops: [0.0, 1.0],
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    width: Scaling.S(50),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(9999.0, 9999.0)),
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        WidgetsFlutterBinding.ensureInitialized();
                                        // StatusBarControl.setColor(
                                        //     Colors.white
                                        //         .withOpacity(0.0));
                                        // StatusBarControl.setHidden(
                                        //     false,
                                        //     animation:
                                        //     StatusBarAnimation
                                        //         .FADE);
                                        // StatusBarControl.setStyle(StatusBarStyle.DARK_CONTENT);
                                        //
                                        // /// TODO: Back
                                        StatusBarControl.setHidden(false,animation: StatusBarAnimation.FADE);
                                        StatusBarControl.setColor(Colors.white.withOpacity(0.0));
                                        StatusBarControl.setStyle(StatusBarStyle.DARK_CONTENT);


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
                          SizedBox(
                            height: Scaling.H(100),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.all(Scaling.S(20)).copyWith(top: 0.0),
                            child: SizedBox(
                              width: Scaling.screenW! / 1.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.getTvDetails.name,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay-Bold',
                                      fontSize: Scaling.S(30),
                                      color: const Color(0xffffffff),
                                      shadows: const [
                                        Shadow(
                                          color: Color(0x80000000),
                                          offset: Offset(0, 5),
                                          blurRadius: 10,
                                        )
                                      ],
                                    ),
                                    softWrap: true,
                                  ),
                                  Text(
                                    '${state.getTvDetails.voteCount.floor() + 1000} People wathing',
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay-Regular',
                                      fontSize: Scaling.S(15),
                                      color: const Color(0xb2ffffff),
                                    ),
                                    softWrap: false,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        state.getTvDetails.voteAverage
                                            .toString()
                                            .substring(0, 1),
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay-Medium',
                                          fontSize: Scaling.S(20),
                                          color: const Color(0xfffecb2f),
                                        ),
                                        softWrap: false,
                                      ),
                                      Text(
                                        '.${state.getTvDetails.voteAverage.toString().substring(2, 3)}',
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay-Regular',
                                          fontSize: Scaling.S(12),
                                          color: const Color(0xfffecb2f),
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
                                              "assets/icons/vote_avarage_stare_icon.svg",
                                              height: Scaling.S(13.21),
                                              color: index <=
                                                      ((state.getTvDetails
                                                                  .voteAverage!
                                                                  .round()) /
                                                              2) -
                                                          1
                                                  ? const Color(0xfffecb2f)
                                                  : const Color(0xffd2d2d2),
                                            ),
                                          );
                                        }),
                                      ),
                                    ],
                                  ),

                        
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.all(Scaling.S(20)).copyWith(bottom: Scaling.S(10),top: 0.0),
                            child: Row(
                              
                              mainAxisAlignment:MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset("assets/icons/start_play_icon.svg",height: Scaling.S(54),)
                              ],
                            ),
                          ),
                          Container(
                            height: Scaling.S(230),
                            padding: EdgeInsets.only(right: Scaling.S(20),left: Scaling.S(20)),
                            child: SingleChildScrollView(
                              child: Text(
                                "${state.getTvDetails.overview}\n\n",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay-Regular',
                                  fontSize: Scaling.S(20),
                                  color: const Color(0xffffffff),
                                  
                                  height: 1.4,
                                ),
                                textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
                              ),
                            ),
                          )
                          
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.all(Scaling.S(20)).copyWith(right: 0.0,left: 0.0),
                  child:Column(
                    children: [

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
                                        .getTvDetails
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
                                                  .getTvDetails
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
                                              .getTvDetails
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
