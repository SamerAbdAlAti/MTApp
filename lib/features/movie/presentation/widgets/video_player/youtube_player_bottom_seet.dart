import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/movie/presentation/manager/app_movie_blocs_and_cubits/bloc/movie_bloc.dart';
import 'package:movie/features/movie/presentation/manager/app_movie_blocs_and_cubits/ui_bloc/ui_bloc.dart';

import 'package:movie/features/movie/presentation/manager/enum/unum.dart';
import 'package:movie/features/movie/presentation/widgets/nvigate_pages/now_playing_list_screen.dart';
import 'package:size_builder/size_builder.dart';
import 'package:status_bar_control/status_bar_control.dart';
import 'package:youtube/youtube_thumbnail.dart';

class YouTubePlayerBottomSheet extends StatelessWidget {
  const YouTubePlayerBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UiBloc, UiState>(
      builder: (context, uiState) {
        UiBloc uiBloc = UiBloc.get(context);
        return BlocBuilder<MovieBloc, MovieState>(
          builder: (context, movieState) {

            Scaling.scaling(context);
            switch (movieState.movieVideosState) {
              case RequestsState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case RequestsState.loaded:
                return Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                  ),
                  height: Scaling.screenH,
                  width: double.maxFinite,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: Scaling.S(6),
                      ),
                      Container(
                        height: Scaling.S(4),
                        width: Scaling.S(80),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[400],
                        ),
                      ),
                      SizedBox(
                        height: Scaling.S(20),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: Scaling.S(20),
                              ),
                              Column(
                                children: List.generate(
                                    movieState.movieVideos.length, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      StatusBarControl.setHidden(false,
                                          animation: StatusBarAnimation.FADE);
                                      StatusBarControl.setColor(Colors.black);
                                      StatusBarControl.setStyle(
                                          StatusBarStyle.LIGHT_CONTENT);

                                      SystemChrome.setPreferredOrientations([
                                        DeviceOrientation.portraitUp,
                                        DeviceOrientation.portraitDown,
                                      ]).then((value) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => VideoScreen(
                                                  videoId: movieState
                                                      .movieVideos[index].key,
                                                  list:
                                                  movieState.movieVideos,
                                                )));
                                      });
                                      /// TODO: Show Bottom Sheet For Show Videos

                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(Scaling.S(20)),
                                      child: Row(
                                        children: [
                                          Container(
                                              height: Scaling.S(100),
                                              width: Scaling.S(160),
                                              color: Colors.black26,
                                              child: CachedNetworkImage(
                                                imageUrl: YoutubeThumbnail(
                                                        youtubeId: movieState
                                                            .movieVideos[index]
                                                            .key)
                                                    .mq(),
                                                fit: BoxFit.cover,
                                              )),
                                          SizedBox(
                                            width: Scaling.S(15),
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              height: Scaling.S(100),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    movieState
                                                        .movieVideos[index]
                                                        .name,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'SFProDisplay-Bold',
                                                      fontSize: Scaling.S(15),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black87,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    softWrap: true,
                                                  ),
                                                  SizedBox(
                                                    height: Scaling.S(10),
                                                  ),
                                                  Text(
                                                    movieState
                                                        .movieVideos[index]
                                                        .type,
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[600]),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    movieState
                                                        .movieVideos[index]
                                                        .publishedAt
                                                        .substring(0, 10),
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[600]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              case RequestsState.error:
                return Container();
            }
          },
        );
      },
    );
  }
}
