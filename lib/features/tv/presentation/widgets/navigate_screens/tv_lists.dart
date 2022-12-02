import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:movie/features/movie/presentation/manager/componants/constance.dart';
import 'package:movie/features/movie/presentation/manager/shear/app_string_componts.dart';
import 'package:movie/features/tv/domain/entities/tv.dart';
import 'package:movie/features/tv/presentation/blocs_and_cubits/tv_bloc/tv_bloc.dart';
import 'package:movie/features/tv/presentation/manager/componants/constance.dart';
import 'package:movie/features/tv/presentation/widgets/navigate_screens/tv_details_screen.dart';
import 'package:size_builder/size_builder.dart';
import 'package:status_bar_control/status_bar_control.dart';

class TvLists extends StatelessWidget {
  final List<Tv> list;

  const TvLists({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.all(Scaling.S(20)).copyWith(top: 0.0, bottom: 0.0),
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
                            "Now List",
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

                            children: List.generate(list.length, (index) {
                              Tv model = list[index];
                              return buildTvList(
                                  height: Scaling.S(247),
                                  width: Scaling.S(170),
                                  model: model,
                                  index: index,
                                  context, onTap: () async {
                                /// TODO: Get Movie Details
                                WidgetsFlutterBinding.ensureInitialized();
                                StatusBarControl.setHidden(true,animation: StatusBarAnimation.FADE);
                                context.read<TvBloc>().add(GetTvDetailsEvent(tvId: list[index].id));
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const TvDetailsScreen()));
                                /// TODO: Get Movie Videos
                                /// TODO: Make StatusBar Hidden
                                // StatusBarControl.setHidden(true,
                                //     animation: StatusBarAnimation.FADE);
                                // await Navigator.push(
                                //
                                //     /// TODO: Navigate To Details
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) =>
                                //           const MoviesDetailsScreen(),
                                //     ));
                              });
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
      },
    );
  }
}
