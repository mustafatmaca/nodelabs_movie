import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as storage;
import 'package:nodelabs_movie/core/constants/constants.dart';
import 'package:nodelabs_movie/data/models/movie_model.dart';

import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_services.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class MovieServices {
  factory MovieServices(Dio dio, storage.FlutterSecureStorage secureStorage) =
      _MovieServices;

  @GET('/movie/favorites')
  Future<HttpResponse<List<MovieModel>>> getFavoriteMovies();

  @GET('/movie/list')
  Future<HttpResponse<List<MovieModel>>> getMovies({
    @Query('page') int? page,
  });
}
