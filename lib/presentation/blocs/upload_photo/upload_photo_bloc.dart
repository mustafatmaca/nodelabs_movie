import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nodelabs_movie/core/resources/data_state.dart';
import 'package:nodelabs_movie/domain/usecases/upload_photo.dart';
import 'package:nodelabs_movie/presentation/blocs/upload_photo/upload_photo_event.dart';
import 'package:nodelabs_movie/presentation/blocs/upload_photo/upload_photo_state.dart';

class UploadPhotoBloc extends Bloc<UploadPhotoEvent, UploadPhotoState> {
  final UploadPhotoUseCase _uploadPhotoUseCase;
  UploadPhotoBloc(this._uploadPhotoUseCase) : super(UploadPhotoInitial()) {
    on<PickPhoto>((event, emit) async {
      final photo = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      if (photo != null) {
        emit(UploadPhotoLoaded(File(photo.path)));
      }
    });

    on<UploadPhoto>((event, emit) async {
      final dataState = await _uploadPhotoUseCase(params: event.pickedPhoto);

      if (dataState is DataSuccess && dataState.data != null) {
        emit(UploadPhotoSuccess(dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(UploadPhotoFailed(dataState.error!));
      }
    });
  }
}
