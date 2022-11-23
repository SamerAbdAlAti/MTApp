import 'package:movie/core/error_handel/error_massege_model.dart';

class ServerException implements Exception{

  final ErrorMessageModel errorMessageModel;

const  ServerException({required this.errorMessageModel});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServerException &&
          runtimeType == other.runtimeType &&
          errorMessageModel == other.errorMessageModel;

  @override
  int get hashCode => errorMessageModel.hashCode;
}