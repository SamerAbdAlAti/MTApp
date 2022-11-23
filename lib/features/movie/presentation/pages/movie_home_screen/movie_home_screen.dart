import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:movie/core/uteils/app_constance.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';
import 'package:movie/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie/features/movie/presentation/ui_bloc/ui_bloc.dart';
import 'package:movie/features/movie/presentation/widgets/now_playing_sction.dart';
import 'package:movie/features/movie/presentation/widgets/popular_section.dart';
import 'package:movie/features/movie/presentation/widgets/top_rated_section.dart';
import 'package:movie/features/movie/presentation/widgets/top_section_search.dart';
import 'package:shimmer/shimmer.dart';
import 'package:size_builder/size_builder.dart';

class MovieHomeScreen extends StatelessWidget {
  const MovieHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Scaling.scaling(context);
    return BlocBuilder<UiBloc, UiState>(
      builder: (context, stateOne) {
        UiBloc uiBloc = UiBloc.get(context);
        return BlocBuilder<MovieBloc, MovieState>(
          builder: (context, stateTow) {
            return Scaffold(
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const TopSectionSearch(),
                    SizedBox(
                        height: Scaling.S(170), child: const TopRatedSection()),
                    SizedBox(
                        height: Scaling.S(380),
                        child: const NowPlayingSection()),
                    SizedBox(
                        height: Scaling.S(500), child: const PopularSection()),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

Widget buildOnBoardingToHome(Movie model) => Container(
      margin: EdgeInsets.symmetric(horizontal: Scaling.W(5)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Scaling.S(6.0)),
      ),
      child: CachedNetworkImage(
        width: Scaling.S(120),
        height: Scaling.S(120),
        fit: BoxFit.cover,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[400]!,
          highlightColor: Colors.white,
          child: Container(
            height: Scaling.S(170),
            width: Scaling.S(120),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        imageUrl: AppConstance.imageCompletePathUrl(path: model.posterPath),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          color: Colors.white,
        ),
      ),
    );

Widget buildNowPlayingMovieList(Movie model) => Container(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          /// TODO : NAVIGATE TO  MOVIE DETAILS
        },
        child: Column(
          children: [
            Container(
              height: Scaling.S(210),
              width: Scaling.S(140),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    AppConstance.imageCompletePathUrl(path: model.backdropPath),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[850]!,
                  highlightColor: Colors.grey[800]!,
                  child: Container(
                    height: 300,
                    width: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: Scaling.H(10),
            ),
            Container(
              width: Scaling.S(140),
              child: Text(
                model.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'SFProDisplay-Bold',
                  fontSize: Scaling.S(16),
                  color: const Color(0xff222222),
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
