import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/movie/presentation/manager/enum/unum.dart';
import 'package:movie/features/movie/presentation/widgets/nvigate_pages/now_playing_list_screen.dart';
import 'package:movie/features/tv/presentation/blocs_and_cubits/tv_bloc/tv_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:size_builder/size_builder.dart';
import 'package:status_bar_control/status_bar_control.dart';
import 'package:youtube/youtube_thumbnail.dart';

class TvYouTubPlayerBottomSheet extends StatelessWidget {
  const TvYouTubPlayerBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Scaling.scaling(context);
    return BlocBuilder<TvBloc, TvState>(
      buildWhen: (c, p) => c.tvVideosState != p.tvVideosState,
      builder: (context, state) {
        switch (state.tvVideosState) {
          case RequestsState.loading:
            return Center(
              child: SizedBox(
                height: Scaling.S(170),
                width: Scaling.screenW,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xfff99f00),
                  ),
                ),
              ),
            );
          // TODO: Handle this case.

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
                            children: List.generate(state.getTvVideos.length,
                                (index) {
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
                                                  videoId: state
                                                      .getTvVideos[index].key,
                                                  list: state.getTvVideos,
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
                                                    youtubeId: state
                                                        .getTvVideos[index].key)
                                                .mq(),
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                              baseColor: Colors.grey[200]!,
                                              highlightColor: Colors.grey[300]!,
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
                                                state.getTvVideos[index].name,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontFamily:
                                                      'SFProDisplay-Bold',
                                                  fontSize: Scaling.S(15),
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black87,
                                                ),
                                                textAlign: TextAlign.start,
                                                softWrap: true,
                                              ),
                                              SizedBox(
                                                height: Scaling.S(10),
                                              ),
                                              Text(
                                                state.getTvVideos[index].type,
                                                style: TextStyle(
                                                    color: Colors.grey[600]),
                                              ),
                                              const Spacer(),
                                              Text(
                                                state.getTvVideos[index]
                                                    .publishedAt
                                                    .substring(0, 10),
                                                style: TextStyle(
                                                    color: Colors.grey[600]),
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
          // TODO: Handle this case.
          case RequestsState.error:
            return Container();
          // TODO: Handle this case.
        }
      },
    );
  }
}
