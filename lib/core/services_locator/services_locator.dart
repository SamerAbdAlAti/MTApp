import 'package:get_it/get_it.dart';
import 'package:movie/app_cubit/app_cubit.dart';
import 'package:movie/features/movie/data/remote/data_sources/remote_data_source.dart';
import 'package:movie/features/movie/data/repositories/movie_repsitory.dart';
import 'package:movie/features/movie/domain/repositories/base_movie_repository.dart';
import 'package:movie/features/movie/domain/use_cases/get_now_playing_use_case.dart';
import 'package:movie/features/movie/domain/use_cases/get_popular_use_case.dart';
import 'package:movie/features/movie/domain/use_cases/get_top_rated_use_case.dart';
import 'package:movie/features/movie/presentation/manager/app_movie_blocs_and_cubits/bloc/movie_bloc.dart';
import 'package:movie/features/movie/presentation/manager/app_movie_blocs_and_cubits/on_boarding_cubit/on_boardings_cubit.dart';
import 'package:movie/features/movie/presentation/manager/app_movie_blocs_and_cubits/ui_bloc/ui_bloc.dart';
import 'package:movie/features/movie/presentation/manager/app_movie_blocs_and_cubits/you_tube_player_cubit/you_tube_player_cubit.dart';
import 'package:movie/features/tv/data/remote/data_sources/tv_data_source.dart';
import 'package:movie/features/tv/data/repositories/tv_repository.dart';
import 'package:movie/features/tv/domain/repositories/base_tv_repository.dart';
import 'package:movie/features/tv/domain/use_cases/gat_tv_top_rated_use_case.dart';
import 'package:movie/features/tv/presentation/blocs_and_cubits/tv_bloc/tv_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc

    getIt.registerFactory(() => UiBloc());
    getIt.registerFactory(() => OnBoardingsCubit());
    getIt.registerFactory(() => YouTubePlayerCubit());
    getIt.registerFactory(() => AppCubit());

    getIt.registerFactory(
      () => MovieBloc(
        getNowPlayingUseCase: getIt(),
        getPopularUseCase: getIt(),
        getTopRatedUseCase: getIt(),
        getMovieDetailsUseCase: getIt(),
        getMovieVideosUseCase: getIt(),
        movieSearchUseCase: getIt(),
      ),
    );

    /// Data Source

    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    /// Repository

    getIt.registerLazySingleton<BaseMovieRepository>(
        () => MovieRepository(getIt()));

    /// Use Cases Movies
    getIt.registerLazySingleton(() => GetNowPlayingUseCase(getIt()));
    getIt.registerLazySingleton(() => GetPopularUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedUseCase(getIt()));
    getIt.registerLazySingleton(() => MovieSearchUseCase(getIt()));
    getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetMovieVideosUseCase(getIt()));

    /// //////////////////////////////////////////////////////////////////////////////// Tv

    /// Data Source

    getIt.registerLazySingleton<BaseTvRemoteDataSource>(
        () => TvRemoteDataSource());

    ///  Tv Repository

    getIt.registerLazySingleton<BaseTvRepository>(() => TvRepository(getIt()));

    /// Use Cases Tv

    getIt.registerLazySingleton(() => GetTvTopRatedUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTvPopularUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTvDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTvVideosUseCase(getIt()));
    getIt.registerLazySingleton(() => SearchTvUseCase(getIt()));

    /// Blocs
    getIt.registerFactory(
      () => TvBloc(
        getTvPopularUseCase: getIt(),
        getTvTopRatedUseCase: getIt(),
        getTvDetailsUseCase: getIt(),
        getTvVideosUseCase: getIt(),
        searchTvUseCase: getIt(),
      ),
    );
  }
}
