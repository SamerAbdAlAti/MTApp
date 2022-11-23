import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:movie/core/uteils/app_constance.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';
import 'package:movie/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie/features/movie/presentation/manager/enum/unum.dart';
import 'package:shimmer/shimmer.dart';
import 'package:size_builder/size_builder.dart';

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
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xfff99f00),
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
                    height: Scaling.S(450),
                    width: Scaling.screenW,
                    child: IntrinsicGridView.horizontal(
                      padding: const EdgeInsets.only(
                          top: 16, bottom: 12, left: 12, right: 12),
                      // columnCount: 3,

                      verticalSpace: 10,
                      horizontalSpace: 10,

                      children: List.generate(
                        stateTow.popularMovie.length,
                        (index) {
                          Movie model = stateTow.popularMovie[index];

                          return Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                height: Scaling.S(210),
                                width: Scaling.S(140),
                                decoration: BoxDecoration(
                                  color: const Color(0xff8d8686),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),

                                /// On Popular Tap
                                child: InkWell(
                                  onTap: () {},
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: AppConstance.imageCompletePathUrl(
                                        path: model.backdropPath),
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      baseColor: Colors.grey[850]!,
                                      highlightColor: Colors.grey[800]!,
                                      child: Container(
                                        height: 300,
                                        width: 120.0,
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
                                        Radius.elliptical(9999.0, 9999.0)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: Scaling.S(4),
                                        ),
                                        Row(
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
                                              '.${model.voteAverage.toString().substring(2, 3)}\n',
                                              style: TextStyle(
                                                fontFamily:
                                                    'SFProDisplay-Regular',
                                                fontSize: Scaling.S(10),
                                                color: const Color(0xffffffff),
                                              ),
                                              softWrap: false,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
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
