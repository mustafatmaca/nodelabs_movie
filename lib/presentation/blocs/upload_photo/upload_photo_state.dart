import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class UploadPhotoState extends Equatable {
  final File? pickedPhoto;
  final String? photoUrl;
  final DioException? error;

  const UploadPhotoState({this.pickedPhoto, this.photoUrl, this.error});

  @override
  List<Object> get props => [pickedPhoto!, photoUrl!, error!];
}

final class UploadPhotoInitial extends UploadPhotoState {}

final class UploadPhotoLoaded extends UploadPhotoState {
  const UploadPhotoLoaded(File pickedPhoto) : super(pickedPhoto: pickedPhoto);

  @override
  List<Object> get props => [pickedPhoto!];
}

final class UploadPhotoSuccess extends UploadPhotoState {
  const UploadPhotoSuccess(String photoUrl) : super(photoUrl: photoUrl);

  @override
  List<Object> get props => [photoUrl!];
}

final class UploadPhotoFailed extends UploadPhotoState {
  const UploadPhotoFailed(DioException error) : super(error: error);

  @override
  List<Object> get props => [error!];
}
