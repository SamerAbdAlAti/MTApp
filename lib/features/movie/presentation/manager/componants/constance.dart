import 'package:cached_network_image/cached_network_image.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/uteils/app_constance.dart';
import 'package:movie/features/movie/domain/entities/movie.dart';
import 'package:movie/features/movie/presentation/manager/shear/app_string_componts.dart';
import 'package:movie/features/movie/presentation/ui_bloc/ui_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:size_builder/size_builder.dart';

class OnBoardingScreenChange extends Equatable {
  final String imagePath;
  final String title;
  final int currentIndex;

  const OnBoardingScreenChange({
    required this.imagePath,
    required this.title,
    required this.currentIndex,
  });

  @override
  List<Object> get props => [imagePath];
}

Widget buildOnBoardingToHome(Movie model) => Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          width: Scaling.S(320),
          height: double.maxFinite,
          child: Container(
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
              imageUrl:
                  AppConstance.imageCompletePathUrl(path: model.posterPath),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          width: Scaling.S(320),
          child: Padding(
            padding: EdgeInsets.all(Scaling.H(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  model.title,
                  style: const TextStyle(
                    fontFamily: 'SFProDisplay-Bold',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffffff),
                  ),
                  textAlign: TextAlign.center,
                  softWrap: false,
                ),
                SizedBox(
                  width: Scaling.S(10),
                ),
                SvgPicture.asset("assets/icons/top_rated_icon.svg",
                    height: Scaling.S(20)),
              ],
            ),
          ),
        ),
      ],
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
                    height: Scaling.S(300),
                    width: Scaling.S(120),
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




// ignore: must_be_immutable
class BottomNavigation extends StatelessWidget {
  final String iconPath;
  final String labelText;
  TextStyle? textStyle;
  final VoidCallback onPressed;

  BottomNavigation({
    Key? key,
    required this.iconPath,
    this.textStyle,
    required this.labelText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: Scaling.S(70),
      width: Scaling.S(70),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(iconPath),
            SizedBox(
              height: Scaling.S(10),
            ),
            Text(
              labelText,
              style: textStyle!,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}

Widget itemCurrentIndexCondition({
  required bool condition,
  required String lightIcon,
  required String darkIconIcon,
  required String labelText,
  required VoidCallback onPressed,
}) {
  return BottomNavigation(
    iconPath: condition ? darkIconIcon : lightIcon,
    labelText: labelText,
    textStyle: condition
        ? TextStyle(
            fontFamily: 'SFProDisplay-Regular',
            fontSize: Scaling.S(10),
            color: const Color(0xffd6182a),
          )
        : TextStyle(
            fontFamily: 'SFProDisplay-Regular',
            fontSize: Scaling.S(10),
            color: const Color(0xff999999),
          ),
    onPressed: onPressed,
  );
}


