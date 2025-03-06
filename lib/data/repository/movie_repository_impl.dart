import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nodelabs_movie/core/resources/data_state.dart';
import 'package:nodelabs_movie/data/data_sources/remote/movie_services.dart';
import 'package:nodelabs_movie/data/models/movie_model.dart';
import 'package:nodelabs_movie/domain/entities/movie_entity.dart';
import 'package:nodelabs_movie/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieServices _movieServices;

  MovieRepositoryImpl(this._movieServices);

  @override
  Future<DataState<List<MovieModel>>> getFavoriteMovies() async {
    try {
      final httpResponse = await _movieServices.getFavoriteMovies();

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
  Future<DataState<List<MovieEntity>>> getMovies(int page) async {
    try {
      final httpResponse = await _movieServices.getMovies(page: page);

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
  Future<DataState<bool>> favoriteMovie(String movieId) async {
    try {
      final httpResponse = await _movieServices.favoriteMovie(movieId: movieId);

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
