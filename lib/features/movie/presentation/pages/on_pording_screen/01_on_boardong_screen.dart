import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/features/movie/presentation/manager/shear/app_color.dart';
import 'package:movie/features/movie/presentation/manager/shear/app_string_componts.dart';
import 'package:movie/features/movie/presentation/pages/movie_home_screen/movie_home_screen.dart';
import 'package:movie/features/movie/presentation/ui_bloc/ui_bloc.dart';
import 'package:size_builder/size_builder.dart';

class OnBoardingScreen01 extends StatelessWidget {
  const OnBoardingScreen01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Scaling.scaling(context);
    return BlocBuilder<UiBloc, UiState>(
      builder: (context, state) {
        UiBloc bloc = UiBloc.get(context);
        print("build screen on boarding");
        final List<OnBoardingScreenChange> onBoardingList = [
          const OnBoardingScreenChange(
            imagePath: 'assets/images/Bitmap.png',
            title: "Get the first\nMovie &TV information",
            currentIndex: 0,
          ),
          const OnBoardingScreenChange(
            imagePath: 'assets/images/on_boarding_image_tow.png',
            title: "Know the movie\nis not worth Watching",
            currentIndex: 1,
          ),
          const OnBoardingScreenChange(
            imagePath: 'assets/images/on_boarding_image_three.png',
            title: "Real-time\nupdates movie Trailer",
            currentIndex: 2,
          ),
        ];
        return Scaffold(
          backgroundColor: AppColor.onBoardingMainColor,
          body: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: Scaling.screenH,
                    width: double.maxFinite,
                    child: PageView.builder(
                      controller: bloc.onBoardingController,
                      itemCount: onBoardingList.length,
                      onPageChanged: (index) async {
                        context.read<UiBloc>().add(OnBoardingEvent(index));
                      },
                      itemBuilder: (context, index) =>
                          buildOnBoarding(onBoardingList[index], index),
                    ),
                  ),
                  SizedBox(
                    height: Scaling.screenH,
                    width: Scaling.screenW,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Scaling.H(436),
                          ),
                          Text(
                            onBoardingList[state.currentIndex].title,
                            style: TextStyle(
                              fontFamily: 'SFProDisplay-Bold',
                              fontSize: Scaling.S(30),
                              color: const Color(0xffffffff),
                            ),
                            textAlign: TextAlign.center,
                            softWrap: false,
                          ),
                          SizedBox(
                            height: Scaling.H(56.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(3, (index) {
                              return buildSliderForOnBoarding(index);
                            }),
                          ),
                          SizedBox(
                            height: Scaling.H(63),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            width: Scaling.S(192),
                            height: Scaling.S(54),
                            decoration: state.currentIndex == 2
                                ? BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment(-0.6, -1.0),
                                      end: Alignment(0.507, 0.74),
                                      colors: [
                                        Color(0xfff99f00),
                                        Color(0xffdb3069)
                                      ],
                                      stops: [0.0, 1.0],
                                    ),
                                    borderRadius: BorderRadius.circular(27.0),
                                  )
                                : BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Scaling.S(27.0)),
                                    border: Border.all(
                                        width: Scaling.S(2.0),
                                        color: const Color(0xffffffff)),
                                  ),
                            child: MaterialButton(
                              onPressed: () async {
                                if (state.currentIndex != 2) {
                                  await bloc.onBoardingController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                } else {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const MovieHomeScreen()),
                                    );
                                }
                              },
                              child: state.currentIndex == 2
                                  ? const Text(
                                      'Get Stared',
                                      style: TextStyle(
                                        fontFamily: 'PingFangSC-Semibold',
                                        fontSize: 20,
                                        color: Color(0xffffffff),
                                      ),
                                      textAlign: TextAlign.center,
                                      softWrap: false,
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Next',
                                          style: TextStyle(
                                            fontFamily: 'SFProDisplay-Regular',
                                            fontSize: Scaling.S(20.0),
                                            color: const Color(0xffffffff),
                                          ),
                                          textAlign: TextAlign.center,
                                          softWrap: false,
                                        ),
                                        SizedBox(
                                          width: Scaling.W(13),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: Scaling.H(20.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

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

Widget buildOnBoarding(OnBoardingScreenChange model, index) => Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image.asset(
              model.imagePath,
              height: Scaling.H(468),
              width: Scaling.screenW,
              fit: BoxFit.cover,
              alignment: AlignmentDirectional.topCenter,
            ),
            Container(
              height: Scaling.H(294),
              width: Scaling.screenW,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, -0.809),
                  end: Alignment(0.0, -0.107),
                  colors: [Color(0x00222222), Color(0xff222222)],
                  stops: [0.0, 1.0],
                ),
              ),
            )
          ],
        ),
        Container(
          height: Scaling.screenH,
          width: Scaling.screenW,
          decoration: index == 0
              ? const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.0, -0.869),
                    end: Alignment(0.0, 0.963),
                    colors: [Color(0x23f5900e), Color(0xccdb3167)],
                    stops: [0.0, 1.0],
                  ),
                )
              : index == 1
                  ? const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(-0.322, -0.479),
                        end: Alignment(0.546, 0.904),
                        colors: [Color(0x00f5d547), Color(0xb4f5d547)],
                        stops: [0.0, 1.0],
                      ),
                    )
                  : const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -0.965),
                        end: Alignment(0.0, 0.376),
                        colors: [Color(0x00345cc5), Color(0xff142246)],
                        stops: [0.0, 1.0],
                      ),
                    ),
        ),
      ],
    );

Widget buildSliderForOnBoarding(index) => BlocBuilder<UiBloc, UiState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(Scaling.S(10)),
          child: SvgPicture.asset(
            state.currentIndex == index ? onBoardingWhit : onBoardingNotWhit,
          ),
        );
      },
    );
