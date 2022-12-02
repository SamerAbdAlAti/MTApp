import 'package:dio/dio.dart';
import 'package:movie/core/error_handel/error_massege_model.dart';
import 'package:movie/core/error_handel/exception/exception.dart';
import 'package:movie/core/uteils/app_constance.dart';
import 'package:movie/features/movie/data/remote/models/movie_details_model.dart';
import 'package:movie/features/movie/data/remote/models/movie_model.dart';
import 'package:movie/features/movie/data/remote/models/movie_videos_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();

  Future<List<MovieModel>> getTopRatedMovie();

  Future<List<MovieModel>> getPopularMovie();

  Future<MovieDetailsModel> getMovieDetails(int movieID);

  Future<List<MovieVideosModel>> getMovieVideos(int movieID);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await Dio().get(AppConstance.getNowPlayingUrl);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovie() async {
    final response = await Dio().get(AppConstance.getPopularUrl);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovie() async {
    final response = await Dio().get(AppConstance.getTopRatedUrl);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieID) async {
    final response = await Dio().get(
        "${AppConstance.baseUrl}/movie/$movieID?api_key=${AppConstance.apiKey}");

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieVideosModel>> getMovieVideos(int movieID) async {
    final response = await Dio().get(
        "${AppConstance.baseUrl}/movie/$movieID/videos?api_key=${AppConstance.apiKey}");


    if (response.statusCode == 200) {
      return List<MovieVideosModel>.from((response.data['results'] as List)
          .map((e) => MovieVideosModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
