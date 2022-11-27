import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:movie/core/uteils/app_constance.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';
import 'package:movie/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie/features/movie/presentation/manager/componants/constance.dart';
import 'package:movie/features/movie/presentation/manager/enum/unum.dart';
import 'package:movie/features/movie/presentation/manager/shear/app_string_componts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:size_builder/size_builder.dart';

part 'popular_list_screen.dart';

class NowPlayingListScreen extends StatelessWidget {
  const NowPlayingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Scaling.scaling(context);
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (p,c)=>p.nowPlayingState!=c.nowPlayingState,
      builder: (context, state) {

        switch(state.nowPlayingState){
          case RequestsState.loading:{
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
            // TODO: Handle this case.}

          case RequestsState.loaded:
            {
              // TODO: Handle this case.}
              return Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding:
                    EdgeInsets.all(Scaling.S(20)).copyWith(
                        top: 0.0, bottom: 0.0),
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
                                  'Now list',
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay-Semibold',
                                    fontSize: Scaling.S(20),
                                    color: const Color(0xff666666),
                                    letterSpacing: -0.125,
                                  ),
                                  softWrap: false,
                                ),
                                IntrinsicGridView.vertical(
                                  padding: EdgeInsets.only(
                                    top: Scaling.S(16),
                                    bottom: Scaling.S(12),
                                    left: Scaling.S(0),
                                    right: Scaling.S(0),
                                  ),
                                  // columnCount: 3,

                                  verticalSpace: Scaling.S(5),
                                  horizontalSpace: Scaling.S(10),

                                  children: List.generate(
                                      state.nowPlayingMovie.length, (index) {
                                    Movie model = state.nowPlayingMovie[index];
                                    return buildNowPlayingMovieList(
                                      height: Scaling.S(247),width: Scaling.S(170),

                                        state.nowPlayingMovie[index], context);
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
            }
          case RequestsState.error:{
            return Container();
          }
            // TODO: Handle this case.


        }

      },
    );
  }
}
