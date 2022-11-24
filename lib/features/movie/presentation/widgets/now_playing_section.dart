import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:movie/core/uteils/app_constance.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';
import 'package:movie/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie/features/movie/presentation/manager/componants/constance.dart';
import 'package:movie/features/movie/presentation/manager/enum/unum.dart';
import 'package:movie/features/movie/presentation/manager/shear/app_string_componts.dart';
import 'package:movie/features/movie/presentation/pages/pieces_compilation/pieces_compilation.dart';
import 'package:shimmer/shimmer.dart';
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
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: stateTow.nowPlayingMovie.length,
                      itemBuilder: (context, index) {
                        return buildNowPlayingMovieList(
                            stateTow.nowPlayingMovie[index]);
                      },
                    ),
                  ),
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
