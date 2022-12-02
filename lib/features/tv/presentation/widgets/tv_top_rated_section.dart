import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/uteils/app_constance.dart';
import 'package:movie/features/movie/presentation/manager/enum/unum.dart';
import 'package:movie/features/tv/domain/entities/tv.dart';
import 'package:movie/features/tv/presentation/blocs_and_cubits/tv_bloc/tv_bloc.dart';
import 'package:movie/features/tv/presentation/widgets/navigate_screens/tv_details_screen.dart';
import 'package:movie/features/tv/presentation/widgets/navigate_screens/tv_popular_list.dart';
import 'package:shimmer/shimmer.dart';
import 'package:size_builder/size_builder.dart';
import 'package:status_bar_control/status_bar_control.dart';
part 'tv_popular_section.dart';
class TvTopRatedSection extends StatelessWidget {
  final int index;
  final Tv model;
  const TvTopRatedSection(this.model,{Key? key, required this.index,  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      buildWhen: (c,p)=>c.tvTopRatedState!=p.tvTopRatedState,
      builder: (context, state) {
        switch(state.tvTopRatedState){
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
            return Padding(
              padding: EdgeInsets.all(Scaling.S(10)).copyWith(
                  left: index == 0 ? Scaling.S(20) : 10,
                  right:
                  index == state.tvTopRated.length - 1 ? 20 : 10),
              child: InkWell(
                onTap: (){
                  StatusBarControl.setHidden(true,animation: StatusBarAnimation.FADE);
                  context.read<TvBloc>().add(GetTvDetailsEvent(tvId: state.tvTopRated[index].id));
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const TvDetailsScreen()));

                },
                child: Column(
                  children: [
                    Container(
                      height: Scaling.S(210),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      width: Scaling.S(140),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(Scaling.S(8.0)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x73000000),
                            offset: Offset(1, 5),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: CachedNetworkImage(
                        imageUrl: AppConstance.imageCompletePathUrl(
                            path: model.backdropPath!),
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Shimmer.fromColors(
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
                        errorWidget: (context, url, error) =>
                        const Icon(
                          Icons.error,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Scaling.S(10),
                    ),
                    SizedBox(
                      width: Scaling.S(140),
                      child: Text(
                        model.name,
                        style: TextStyle(
                          fontFamily: 'SFProDisplay-Bold',
                          fontSize: Scaling.S(15),
                          color: const Color(0xff222222),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    )
                  ],
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
    );
  }
}
