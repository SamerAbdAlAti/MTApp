import 'package:get_it/get_it.dart';
import 'package:movie/features/movie/data/remote/data_sources/remote_data_source.dart';
import 'package:movie/features/movie/data/repositories/movie_repsitory.dart';
import 'package:movie/features/movie/domain/repositories/base_movie_repository.dart';
import 'package:movie/features/movie/domain/use_cases/get_now_playing_use_case.dart';
import 'package:movie/features/movie/domain/use_cases/get_popular_use_case.dart';
import 'package:movie/features/movie/domain/use_cases/get_top_rated_use_case.dart';
import 'package:movie/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie/features/movie/presentation/ui_bloc/ui_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {



    /// Bloc

    getIt.registerFactory(() => UiBloc());
    getIt.registerFactory(() => MovieBloc(
        getNowPlayingUseCase: getIt(),
        getPopularUseCase: getIt(),
        getTopRatedUseCase: getIt()));

    /// Data Source

    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    /// Repository

    getIt.registerLazySingleton<BaseMovieRepository>(
        () => MovieRepository(getIt()));

    /// Use Cases
    getIt.registerLazySingleton(() => GetNowPlayingUseCase(getIt()));
    getIt.registerLazySingleton(() => GetPopularUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedUseCase(getIt()));
  }
}
