
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:movie/app_cubit/app_cubit.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';
import 'package:movie/features/movie/presentation/manager/app_movie_blocs_and_cubits/bloc/movie_bloc.dart';

import 'package:movie/features/movie/presentation/manager/app_movie_blocs_and_cubits/ui_bloc/ui_bloc.dart';
import 'package:movie/features/movie/presentation/manager/componants/constance.dart';
import 'package:movie/features/movie/presentation/manager/enum/unum.dart';
import 'package:movie/features/movie/presentation/manager/shear/app_string_componts.dart';
import 'package:movie/features/movie/presentation/widgets/nvigate_pages/movies_details_screen.dart';
import 'package:movie/features/movie/presentation/widgets/nvigate_pages/now_playing_list_screen.dart';
import 'package:size_builder/size_builder.dart';
import 'package:status_bar_control/status_bar_control.dart';


part 'popular_section.dart';

part 'top_rated_section.dart';

part '../../../../app_share_ui/build_bottom_navigation_bar.dart';

class NowPlayingSection extends StatefulWidget {

  const NowPlayingSection({Key? key}) : super(key: key);

  @override
  State<NowPlayingSection> createState() => _NowPlayingSectionState();
}

class _NowPlayingSectionState extends State<NowPlayingSection> {
  final ScrollController controller=ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
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
                        controller: controller,
                        keyboardDismissBehavior:ScrollViewKeyboardDismissBehavior.onDrag,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              stateTow.nowPlayingMovie.length - 12, (index) {
                            return index == stateTow.nowPlayingMovie.length - 13
                                ? InkWell(
                                    onTap: () async {
                                      WidgetsFlutterBinding.ensureInitialized();

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
                                    index: index,
                                    model: stateTow.nowPlayingMovie[index],
                                    context, onTap: () async {

                                      /// TODO: Get Movie Details
                                    WidgetsFlutterBinding.ensureInitialized();
                                    context.read<MovieBloc>().add(
                                        GetMovieDetailsEvent(stateTow
                                            .nowPlayingMovie[index].id));
                                    /// TODO: Get Movie Videos
                                    context.read<MovieBloc>().add(
                                        GetMovieVideosEvent(stateTow
                                            .nowPlayingMovie[index].id));
                                    /// TODO: Make StatusBar Hidden
                                    StatusBarControl.setHidden(true,
                                        animation: StatusBarAnimation.FADE);
                                    await Navigator.push(
                                        /// TODO: Navigate To Details
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MoviesDetailsScreen(),
                                        ));
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
