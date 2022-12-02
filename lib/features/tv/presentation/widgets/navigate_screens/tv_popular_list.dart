import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/uteils/app_constance.dart';
import 'package:movie/features/movie/presentation/manager/shear/app_string_componts.dart';
import 'package:movie/features/tv/domain/entities/tv.dart';
import 'package:movie/features/tv/presentation/blocs_and_cubits/tv_bloc/tv_bloc.dart';
import 'package:movie/features/tv/presentation/widgets/navigate_screens/tv_details_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:size_builder/size_builder.dart';
import 'package:status_bar_control/status_bar_control.dart';

class TvPopularList extends StatelessWidget {
  final List<Tv> list;

  const TvPopularList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.all(Scaling.S(20)).copyWith(top: 0.0, bottom: 0.0),
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
                            "Popular List",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay-Semibold',
                              fontSize: Scaling.S(20),
                              color: const Color(0xff666666),
                              letterSpacing: -0.125,
                            ),
                            softWrap: false,
                          ),
                          Column(
                            children: List.generate(list.length, (index) {
                              Tv model = list[index];
                              return Padding(
                                padding: EdgeInsets.all(Scaling.S(20)).copyWith(
                                    right: 0.0,
                                    left: 0.0,
                                    bottom: Scaling.S(5)),
                                child: InkWell(
                                  onTap: () {
                                    StatusBarControl.setHidden(true,
                                        animation: StatusBarAnimation.FADE);
                                    context.read<TvBloc>().add(
                                        GetTvDetailsEvent(
                                            tvId: list[index].id));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const TvDetailsScreen()));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment: AlignmentDirectional.topEnd,
                                        children: [
                                          Container(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            height: Scaling.S(160),
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Scaling.S(8.0)),
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl: AppConstance
                                                  .imageCompletePathUrl(
                                                      path: model.posterPath),
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  Shimmer.fromColors(
                                                baseColor: Colors.grey[850]!,
                                                highlightColor:
                                                    Colors.grey[800]!,
                                                child: Container(
                                                  height: Scaling.S(300),
                                                  width: Scaling.S(120),
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(
                                                Icons.error,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.all(Scaling.S(10)),
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
                                                      color: const Color(
                                                          0xffffffff),
                                                    ),
                                                    softWrap: false,
                                                  ),
                                                  Text(
                                                    '.${model.voteAverage.toString().substring(2, 3)}',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'SFProDisplay-Regular',
                                                      fontSize: Scaling.S(12),
                                                      color: const Color(
                                                          0xffffffff),
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
      },
    );
  }
}
