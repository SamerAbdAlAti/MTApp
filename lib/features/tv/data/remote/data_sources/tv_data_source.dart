import 'package:dio/dio.dart';
import 'package:movie/core/error_handel/error_massege_model.dart';
import 'package:movie/core/error_handel/exception/exception.dart';
import 'package:movie/core/uteils/app_constance.dart';
import 'package:movie/features/tv/data/remote/models/tv_model.dart';
import 'package:movie/features/tv/data/remote/models/tv_videos_model.dart';

abstract class BaseTvRemoteDataSource {
  Future<List<TvModel>> gatTopRatedTv();

  Future<List<TvModel>> gatPopularTv();

  Future<List<TvModel>> searchTv({required String query});

  Future<TvDetailsModel> getTvDetails({required int tvId});

  Future<List<TvVideosModel>> getTvVideos({required int tvId});
}

class TvRemoteDataSource extends BaseTvRemoteDataSource {
  @override
  Future<List<TvModel>> gatPopularTv() async {
    final response = await Dio().get(AppConstance.getTvPopular);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          response.data['results'].map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvModel>> gatTopRatedTv() async {
    final response = await Dio().get(AppConstance.getTvTopRated);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          response.data['results'].map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<TvDetailsModel> getTvDetails({required int tvId}) async {
    final response = await Dio()
        .get("${AppConstance.baseUrl}/tv/$tvId?api_key=${AppConstance.apiKey}");
    if (response.statusCode == 200) {
      return TvDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvVideosModel>> getTvVideos({required int tvId}) async {
    final response = await Dio().get(
        "${AppConstance.baseUrl}/tv/$tvId/videos?api_key=${AppConstance.apiKey}");
    if (response.statusCode == 200) {
      return List<TvVideosModel>.from(
          response.data['results'].map((e) => TvVideosModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvModel>> searchTv({required String query}) async {
    final response = await Dio().get(
        "${AppConstance.baseUrl}/search/tv?api_key=${AppConstance.apiKey}&query=$query");
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          response.data['results'].map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
