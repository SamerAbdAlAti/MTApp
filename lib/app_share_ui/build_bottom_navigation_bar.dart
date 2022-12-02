part of '../features/movie/presentation/widgets/now_playing_section.dart';

class BottomNavigationBarBuild extends StatelessWidget {


  const BottomNavigationBarBuild({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (p,c)=>c.bottomNavigationBarIndex!=p.bottomNavigationBarIndex,

      builder: (context, state) {
        AppCubit cubit=AppCubit.get(context);
        Scaling.scaling(context);
        return Container(
          height: Scaling.S(70),
          width: Scaling.screenW,
          color: const Color(0xfffefefe),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                child: itemCurrentIndexCondition(
                  condition: state.bottomNavigationBarIndex == 0,
                  labelText: "MOVIES",
                  darkIconIcon: movieBottomNavigationBarDark,
                  lightIcon: movieBottomNavigationBarLight,
                  onPressed: () async {
                    WidgetsFlutterBinding.ensureInitialized();
                  cubit.bottomNavigationBarCurrentIndexChange(index: 0);
                  },
                ),
              ),
              Scaling.screenW! <= 700
                  ? const Spacer()
                  : SizedBox(
                      width: Scaling.S(100),
                    ),
              Container(
                child: itemCurrentIndexCondition(
                  condition: state.bottomNavigationBarIndex == 1,
                  labelText: "TV",
                  darkIconIcon: tvBottomNavigationBarDark,
                  lightIcon: tvBottomNavigationBarLight,
                  onPressed: () async {
                    WidgetsFlutterBinding.ensureInitialized();
                    cubit.bottomNavigationBarCurrentIndexChange(index: 1);

                  },
                ),
              ),
              // Scaling.screenW! <= 700
              //     ? const Spacer()
              //     : SizedBox(
              //         width: Scaling.S(100),
              //       ),
              // Container(
              //   child: itemCurrentIndexCondition(
              //     condition: state.bottomNavigationBarIndex == 2,
              //     labelText: "PROFILE",
              //     darkIconIcon: profileBottomNavigationBarDark,
              //     lightIcon: profileBottomNavigationBarLight,
              //     onPressed: () async {
              //       WidgetsFlutterBinding.ensureInitialized();
              //
              //       cubit.bottomNavigationBarCurrentIndexChange(index: 2);
              //     },
              //   ),
              // ),
            ]),
          ),
        );
      },
    );
  }
}

