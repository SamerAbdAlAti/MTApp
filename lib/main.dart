import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie/features/movie/presentation/manager/services_locator/services_locator.dart';
import 'package:movie/features/movie/presentation/manager/shear/app_color.dart';
import 'package:movie/features/movie/presentation/manager/shear/app_style.dart';
import 'package:movie/features/movie/presentation/pages/movie_home_screen/movie_home_screen.dart';
import 'package:movie/features/movie/presentation/pages/on_pording_screen/01_on_boardong_screen.dart';
import 'package:movie/features/movie/presentation/ui_bloc/my_bloc_observer.dart';
import 'package:movie/features/movie/presentation/ui_bloc/ui_bloc.dart';
import 'package:size_builder/size_builder.dart';
import 'package:status_bar_control/status_bar_control.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  ServicesLocator().init();

  await StatusBarControl.setFullscreen(true);
  await StatusBarControl.setColor(AppColor.mainColor);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: true,
          create: (BuildContext context) => getIt<MovieBloc>()
            ..add(GetNowPlayingEvent())
            ..add(GetPopularEvent())
            ..add(GetTopRatedEvent()),
        ),
        BlocProvider(create: (BuildContext context) => getIt<UiBloc>())
      ],
      child: MaterialApp(
        theme: AppStyle.lightTheme,
        darkTheme: AppStyle.darkTheme,
        home: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Scaling.scaling(context);
    return const Material(
      child: OnBoardingScreen01(),
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const MovieHomeScreen(),
            ));
          },
          color: Colors.red,
        ),
      ),
    );
  }
}
