import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as storage;
import 'package:nodelabs_movie/core/constants/constants.dart';
import 'package:nodelabs_movie/data/models/user_model.dart';

import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'user_services.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class UserServices {
  factory UserServices(Dio dio, storage.FlutterSecureStorage secureStorage) =
      _UserServices;

  @POST('/user/login')
  Future<HttpResponse<UserModel>> login({
    @Body() Map<String, dynamic>? userInfo,
  });

  @POST('/user/register')
  Future<HttpResponse<UserModel>> register({
    @Body() Map<String, dynamic>? userInfo,
  });
}
