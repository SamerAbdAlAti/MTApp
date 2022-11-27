import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';
import 'package:movie/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie/features/movie/presentation/manager/componants/constance.dart';
import 'package:movie/features/movie/presentation/manager/enum/unum.dart';
import 'package:movie/features/movie/presentation/manager/shear/app_string_componts.dart';
import 'package:movie/features/movie/presentation/ui_bloc/togel/tog_bloc.dart';
import 'package:movie/features/movie/presentation/widgets/nvigate_pages/movies_details_screen.dart';
import 'package:movie/features/movie/presentation/widgets/nvigate_pages/now_playing_list_screen.dart';
import 'package:size_builder/size_builder.dart';

import '../ui_bloc/ui_bloc.dart';

part 'popular_section.dart';

part 'top_rated_section.dart';

part 'build_bottom_navigation_bar.dart';

class NowPlayingSection extends StatelessWidget {
  const NowPlayingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.nowPlayingState != current.nowPlayingState,
      builder: (context, stateTow) {
        Scaling.scaling(context);
        switch (stateTow.nowPlayingState) {
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
              // TODO: Handle this case.
            }
          case RequestsState.loaded:
            {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text(
                          'Now',
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
                    height: Scaling.H(17),
                  ),
                  SizedBox(
                      height: Scaling.S(300),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: List.generate(
                              stateTow.nowPlayingMovie.length - 12, (index) {
                            return index == stateTow.nowPlayingMovie.length - 13
                                ? InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const NowPlayingListScreen()));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: Scaling.S(210),
                                          width: Scaling.S(140),
                                          decoration: BoxDecoration(
                                            color: const Color(0xfffecb2f),
                                            borderRadius: BorderRadius.circular(
                                                Scaling.S(6)),
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
                                                fontFamily:
                                                    'SFProDisplay-Medium',
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
                                : buildNowPlayingMovieList(
                                    stateTow.nowPlayingMovie[index], context,
                                    onTap: () async {
                                    context.read<MovieBloc>().add(
                                        GetMovieDetailsEvent(stateTow
                                            .nowPlayingMovie[index].id));

                                    await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MoviesDetailsScreen()));
                                  });
                          }),
                        ),
                      )),
                ],
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
