import 'dart:io';

import 'package:nodelabs_movie/core/resources/data_state.dart';
import 'package:nodelabs_movie/core/usecase/usecase.dart';
import 'package:nodelabs_movie/domain/repository/user_repository.dart';

class UploadPhotoUseCase implements UseCase<DataState<String>, File> {
  final UserRepository _userRepository;

  UploadPhotoUseCase(this._userRepository);

  @override
  Future<DataState<String>> call({File? params}) {
    return _userRepository.uploadPhoto(params);
  }
}
