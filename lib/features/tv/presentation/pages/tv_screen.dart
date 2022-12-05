import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/uteils/app_constance.dart';
import 'package:movie/features/movie/presentation/widgets/movie_search/movie_search_screen.dart';
import 'package:movie/features/movie/presentation/widgets/top_section_search.dart';
import 'package:movie/features/tv/domain/entities/tv.dart';
import 'package:movie/features/tv/presentation/blocs_and_cubits/tv_bloc/tv_bloc.dart';
import 'package:movie/features/tv/presentation/widgets/navigate_screens/search_tv_screen/search_tv_screen.dart';
import 'package:movie/features/tv/presentation/widgets/navigate_screens/tv_lists.dart';
import 'package:movie/features/tv/presentation/widgets/tv_top_rated_section.dart';
import 'package:shimmer/shimmer.dart';
import 'package:size_builder/size_builder.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Scaling.scaling(context);
    return BlocBuilder<TvBloc, TvState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              TopSectionSearch(
                title: 'Tv',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TvSearchScreen()));
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Scaling.S(20),
                      ),
                      Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              height: Scaling.S(285),

                              /// Top Rated Tv Section

                              child: Row(
                                  children: List.generate(
                                      state.tvTopRated.length, (index) {
                                return index >= 6
                                    ? Container()
                                    : index == 5
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                                right: Scaling.S(20)),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TvLists(
                                                              list: state
                                                                  .tvTopRated,
                                                            )));
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                    height: Scaling.S(10),
                                                  ),
                                                  Container(
                                                    height: Scaling.S(210),
                                                    width: Scaling.S(140),
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xfffecb2f),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              Scaling.S(6)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: const Color(
                                                              0xffc2a650),
                                                          offset: Offset(
                                                              0, Scaling.S(5)),
                                                          blurRadius:
                                                              Scaling.S(6),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'MORE',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'SFProDisplay-Medium',
                                                          fontSize:
                                                              Scaling.S(20),
                                                          color: const Color(
                                                              0xffffffff),
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        softWrap: false,
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                ],
                                              ),
                                            ),
                                          )
                                        : TvTopRatedSection(
                                            state.tvTopRated[index],
                                            index: index);
                              })),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(Scaling.S(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                const TvPopularSection(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
