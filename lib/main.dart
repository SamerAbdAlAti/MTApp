import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/app_cubit/app_cubit.dart';
import 'package:movie/app_share_ui/pieces_compilation/pieces_compilation.dart';
import 'package:movie/core/cache_helper/cache_helper.dart';
import 'package:movie/core/services_locator/services_locator.dart';
import 'package:movie/features/movie/presentation/manager/app_movie_blocs_and_cubits/bloc/movie_bloc.dart';
import 'package:movie/features/movie/presentation/manager/app_movie_blocs_and_cubits/on_boarding_cubit/on_boardings_cubit.dart';
import 'package:movie/features/movie/presentation/manager/app_movie_blocs_and_cubits/ui_bloc/my_bloc_observer.dart';
import 'package:movie/features/movie/presentation/manager/app_movie_blocs_and_cubits/ui_bloc/ui_bloc.dart';
import 'package:movie/features/movie/presentation/manager/app_movie_blocs_and_cubits/you_tube_player_cubit/you_tube_player_cubit.dart';
import 'package:movie/features/movie/presentation/manager/shear/app_style.dart';
import 'package:movie/features/movie/presentation/pages/movie_home_screen/movie_home_screen.dart';
import 'package:movie/features/movie/presentation/pages/on_pording_screen/on_boardong_screen.dart';
import 'package:movie/features/movie/presentation/widgets/movie_search/movie_search_screen.dart';
import 'package:movie/features/tv/presentation/blocs_and_cubits/tv_bloc/tv_bloc.dart';
import 'package:movie/features/tv/presentation/widgets/navigate_screens/tv_details_screen.dart';
import 'package:size_builder/size_builder.dart';
import 'package:status_bar_control/status_bar_control.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  await CacheHelper.init();

  bool? isFirst_ = CacheHelper.getBool(key: "first_time");
  Bloc.observer = MyBlocObserver();
  OnBoardingsCubit();

if(isFirst_==null){
  await StatusBarControl.setFullscreen(true);
  await StatusBarControl.setColor(Colors.white.withOpacity(0.0));
  await StatusBarControl.setStyle(StatusBarStyle.DARK_CONTENT);
  await StatusBarControl.setNavigationBarStyle(NavigationBarStyle.DARK);
}
else{
  await StatusBarControl.setFullscreen(false);
  await StatusBarControl.setColor(
      Colors.white.withOpacity(0.0));
  await StatusBarControl.setStyle(
    StatusBarStyle.DARK_CONTENT,
  );
}
  runApp(MyApp(
    isFirst: isFirst_,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isFirst;

  const MyApp({super.key, required this.isFirst});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => getIt<MovieBloc>()
            ..add(GetPopularEvent())
            ..add(GetNowPlayingEvent())
            ..add(GetTopRatedEvent()),
        ),
        BlocProvider(create: (BuildContext context) => getIt<UiBloc>()),
        BlocProvider(create: (BuildContext context) => getIt<AppCubit>()),
        BlocProvider(
            create: (BuildContext context) => getIt<YouTubePlayerCubit>()),
        BlocProvider(
            create: (BuildContext context) => getIt<TvBloc>()
              ..add(GetTvTopRatedEvent())
              ..add(GetTvPopularEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppStyle.lightTheme,
        darkTheme: AppStyle.darkTheme,
        home: Home(isFirst: isFirst),
      ),
    );
  }
}

class Home extends StatelessWidget {
  final bool? isFirst;

  const Home({Key? key, required this.isFirst}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Scaling.scaling(context);
    return Material(
      child: isFirst == null
          ? const OnBoardingScreen()
          : const PiecesCompilation(),
    );
  }
}
