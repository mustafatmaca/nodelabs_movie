import 'dart:io';

import 'package:nodelabs_movie/core/resources/data_state.dart';
import 'package:nodelabs_movie/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<DataState<UserEntity>> login(Map<String, dynamic>? userInfo);
  Future<DataState<UserEntity>> register(Map<String, dynamic>? userInfo);
  Future<DataState<String>> uploadPhoto(File? photo);
}
