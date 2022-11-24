part of 'now_playing_section.dart';

class BottomNavigationBarBuild extends StatelessWidget {


  const BottomNavigationBarBuild({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UiBloc, UiState>(
      buildWhen: (c, p) =>
          c.bottomNavigationBarCurrentIndex !=
          p.bottomNavigationBarCurrentIndex,
      builder: (context, stateOne) {
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
                  condition: stateOne.bottomNavigationBarCurrentIndex == 0,
                  labelText: "MOVIES",
                  darkIconIcon: movieBottomNavigationBarDark,
                  lightIcon: movieBottomNavigationBarLight,
                  onPressed: () async {
                    WidgetsFlutterBinding.ensureInitialized();
                    context
                        .read<UiBloc>()
                        .add(const BottomNavigationBarCurrentIndexEvent(0));
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
                  condition: stateOne.bottomNavigationBarCurrentIndex == 1,
                  labelText: "TV",
                  darkIconIcon: tvBottomNavigationBarDark,
                  lightIcon: tvBottomNavigationBarLight,
                  onPressed: () async {
                    WidgetsFlutterBinding.ensureInitialized();
                    context
                        .read<UiBloc>()
                        .add(const BottomNavigationBarCurrentIndexEvent(1));

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
                  condition: stateOne.bottomNavigationBarCurrentIndex == 2,
                  labelText: "PROFILE",
                  darkIconIcon: profileBottomNavigationBarDark,
                  lightIcon: profileBottomNavigationBarLight,
                  onPressed: () async {
                    WidgetsFlutterBinding.ensureInitialized();
                    context
                        .read<UiBloc>()
                        .add(const BottomNavigationBarCurrentIndexEvent(2));


                  },
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}

