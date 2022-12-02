part of 'now_playing_list_screen.dart';

class VideoScreen extends StatelessWidget {
  final String videoId;
  final List<MovieVideos> list;

  const VideoScreen({super.key, required this.videoId, required this.list});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Scaling.scaling(context);
          StatusBarControl.setColor(Colors.white.withOpacity(0.0),
              animated: true);
          return await onBackButton(context);
        },
        child: BlocConsumer<YouTubePlayerCubit, YouTubePlayerState>(
          listener: (context, state) {},
          builder: (context, state) {
            YouTubePlayerCubit cubit = YouTubePlayerCubit.get(context);
            cubit.youtubePlayerController =
                YoutubePlayerController(initialVideoId: videoId);
            print(state);
            switch (state.youTubePlayerState) {
              case RequestsState.loading:
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

              case RequestsState.loaded:
                return Scaffold(
                  body: SafeArea(
                    child: Column(
                      children: [
                        YoutubePlayer(
                          controller: cubit.youtubePlayerController,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Column(
                                  children: List.generate(list.length, (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        cubit.updateVideoKey(
                                            videoKey: list[index].key);
                                      },
                                      child: Container(
                                        // color:
                                        child: Padding(
                                          padding:
                                              EdgeInsets.all(Scaling.S(20)),
                                          child: Row(
                                            children: [
                                              Container(
                                                  height: Scaling.S(100),
                                                  width: Scaling.S(160),
                                                  color: Colors.black26,
                                                  child: CachedNetworkImage(
                                                    imageUrl: YoutubeThumbnail(
                                                            youtubeId:
                                                                list[index].key)
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        list[index].name,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'SFProDisplay-Bold',
                                                          fontSize:
                                                              Scaling.S(15),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black87,
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        softWrap: true,
                                                      ),
                                                      SizedBox(
                                                        height: Scaling.S(10),
                                                      ),
                                                      Text(
                                                        list[index].type,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey[600]),
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        list[index]
                                                            .publishedAt
                                                            .substring(0, 10),
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey[600]),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
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
                  ),
                );

              case RequestsState.error:
                return Container();
            }
          },
        ));
  }
}

Future<bool> onBackButton(BuildContext context) async {
  StatusBarControl.setHidden(true, animation: StatusBarAnimation.FADE);
  Navigator.of(context).pop(true);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((value) {});
  return true;
}
//
// class BuildVideoListItem extends StatelessWidget {
//   final List<MovieVideos> list;
//
//   const BuildVideoListItem({
//     Key? key,
//     required this.list,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<YouTubePlayerCubit, YouTubePlayerState>(
//       buildWhen: (c, p) => p.videoPlayerKey != c.videoPlayerKey,
//       builder: (context, state) {
//         YouTubePlayerCubit cubit = YouTubePlayerCubit.get(context);
//         return
//       },
//     );
//   }
// }
