import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nodelabs_movie/core/resources/data_state.dart';
import 'package:nodelabs_movie/data/data_sources/remote/user_services.dart';
import 'package:nodelabs_movie/domain/entities/user_entity.dart';
import 'package:nodelabs_movie/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserServices _userServices;

  UserRepositoryImpl(this._userServices);

  @override
  Future<DataState<UserEntity>> login(Map<String, dynamic>? userInfo) async {
    try {
      final httpResponse = await _userServices.login(userInfo: userInfo);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<UserEntity>> register(Map<String, dynamic>? userInfo) async {
    try {
      final httpResponse = await _userServices.register(userInfo: userInfo);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<String>> uploadPhoto(File? photo) async {
    try {
      final httpResponse = await _userServices.uploadPhoto(photo: photo);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
