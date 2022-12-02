import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:movie/core/uteils/app_constance.dart';
import 'package:movie/features/tv/domain/entities/tv.dart';
import 'package:shimmer/shimmer.dart';
import 'package:size_builder/size_builder.dart';

Widget buildTvList(
  context, {
  Tv? model,
  double? height,
  double? width,
  GestureTapCallback? onTap,
  int? index,
}) =>
    Container(
      padding: EdgeInsets.only(right:Scaling.S(4),left: Scaling.S(4)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              height: height ?? Scaling.S(210),
              width: width ?? Scaling.S(140),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: CachedNetworkImage(
                cacheManager: CacheManager(
                    Config('customKey1', stalePeriod: const Duration(days: 7))),
                fit: BoxFit.cover,
                imageUrl: AppConstance.imageCompletePathUrl(
                    path: model!.backdropPath!),
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
            SizedBox(
              width: Scaling.S(140),
              height: Scaling.S(40),
              child: Text(
                model.name,
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
