import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/uteils/app_constance.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';
import 'package:movie/features/movie/presentation/manager/app_movie_blocs_and_cubits/bloc/movie_bloc.dart';
import 'package:movie/features/movie/presentation/manager/enum/unum.dart';
import 'package:movie/features/movie/presentation/widgets/nvigate_pages/movies_details_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:size_builder/size_builder.dart';
import 'package:status_bar_control/status_bar_control.dart';

class MovieSearchScreen extends StatelessWidget {
  const MovieSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Scaling.scaling(context);

    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        MovieBloc movieBloc = MovieBloc.get(context);

        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(Scaling.S(20)),
                  child: SizedBox(
                    height: Scaling.S(60),
                    child: TextField(
                      controller: movieBloc.controller,

                      /// TODO: Search Request
                      onSubmitted: (value) async {
                        context
                            .read<MovieBloc>()
                            .add(SearchMovieEvent(query: value.toString()));
                      },

                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontFamily: 'SFProDisplay-Bold',
                        fontSize: Scaling.S(20),
                        color: const Color(0xff000000),
                      ),
                      cursorColor: Colors.black,
                      cursorWidth: Scaling.S(2),
                      cursorHeight: Scaling.S(25),
                      decoration: InputDecoration(
                        hintText: "\tSearch & Find Movies",
                        suffixIcon: IconButton(onPressed: (){
                          Navigator.pop(context);
                        },
                        icon:const Icon(Icons.arrow_forward),),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xfff99f00),
                              width: Scaling.S(1)),
                          borderRadius: BorderRadius.circular(
                            Scaling.S(20),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xffdb3069),
                              width: Scaling.S(2),
                            ),
                            borderRadius: BorderRadius.circular(Scaling.S(20))),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: Scaling.S(10)),
                          child: Container(
                              clipBehavior: Clip.antiAlias,
                              width: Scaling.S(60),
                              height: Scaling.S(60),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      Scaling.S(20),
                                    ),
                                    bottomLeft: Radius.circular(Scaling.S(20))),
                                gradient: const LinearGradient(
                                  begin: Alignment(0.0, -1.0),
                                  end: Alignment(0.0, 1.0),
                                  colors: [
                                    Color(0xfff99f00),
                                    Color(0xffdb3069)
                                  ],
                                  stops: [0.0, 1.0],
                                ),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  context.read<MovieBloc>().add(
                                      SearchMovieEvent(
                                          query: movieBloc.controller.text));
                                },
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/search_icon.svg",
                                        color: Colors.white,
                                        height: Scaling.S(30),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),

                /// TODO : Duplicate The Widget
                ///

                BlocBuilder<MovieBloc, MovieState>(
                  buildWhen: (c, p) => c.searchMovieState != p.searchMovieState,
                  builder: (context, state) {
                    switch (state.searchMovieState) {
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
                        return state.searchMovie.isEmpty
                            ? Expanded(
                              child: Center(
                                child: SizedBox(
                                    height: Scaling.S(200),
                                    width: Scaling.S(200),
                                    child: SvgPicture.asset(
                                      "assets/icons/slider_icon_on_boarding_whit.svg",
                                      color: Colors.grey[300],
                                    )),
                              ),
                            )
                            : Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: List<Widget>.generate(
                                      state.searchMovie.length,
                                      (index) {
                                        Movie model = state.searchMovie[index];
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              StatusBarControl.setHidden(true,
                                                  animation:
                                                      StatusBarAnimation.FADE);
                                              context.read<MovieBloc>().add(
                                                  GetMovieVideosEvent(
                                                      model.id));

                                              context.read<MovieBloc>().add(
                                                  GetMovieDetailsEvent(
                                                      model.id));
                                              return const MoviesDetailsScreen();
                                            }));
                                          },
                                          child: Card(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.all(Scaling.S(20)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: Scaling.S(120),
                                                    height: Scaling.S(120),
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    Scaling.S(
                                                                        10))),
                                                    child: CachedNetworkImage(
                                                      imageUrl: AppConstance
                                                          .imageCompletePathUrl(
                                                        path: model
                                                                .backdropPath ??
                                                            model.posterPath,
                                                      ),
                                                      fit: BoxFit.cover,
                                                      cacheManager:
                                                          CacheManager(Config(
                                                              'customKey1',
                                                              stalePeriod:
                                                                  const Duration(
                                                                      hours:
                                                                          1))),
                                                      placeholder: (context,
                                                              url) =>
                                                          Shimmer.fromColors(
                                                        baseColor:
                                                            Colors.grey[200]!,
                                                        highlightColor:
                                                            Colors.grey[400]!,
                                                        child: Container(
                                                          height:
                                                              Scaling.S(300),
                                                          width: Scaling.S(120),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                        Icons.error,
                                                        color: Colors.black12,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: Scaling.S(20),
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(
                                                      height: Scaling.S(120),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            Scaling.S(5)),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              model.title,
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'SFProDisplay-Bold',
                                                                fontSize:
                                                                    Scaling.S(
                                                                        15),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              softWrap: true,
                                                            ),
                                                            const Spacer(),
                                                            Text(
                                                              model.overview,
                                                              maxLines: 4,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'SFProDisplay-Regular',
                                                                fontSize:
                                                                    Scaling.S(
                                                                        13),
                                                                color: const Color(
                                                                    0xff666666),
                                                                height: 1.4,
                                                              ),
                                                              textHeightBehavior:
                                                                  const TextHeightBehavior(
                                                                      applyHeightToFirstAscent:
                                                                          false),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                      // TODO: Handle this case.
                      case RequestsState.error:
                        return Container();
                        // TODO: Handle this case.
                        break;
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
