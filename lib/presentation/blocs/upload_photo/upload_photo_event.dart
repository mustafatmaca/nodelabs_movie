import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class UploadPhotoEvent extends Equatable {
  final File? pickedPhoto;

  const UploadPhotoEvent({this.pickedPhoto});

  @override
  List<Object> get props => [pickedPhoto!];
}

class PickPhoto extends UploadPhotoEvent {}

class UploadPhoto extends UploadPhotoEvent {
  const UploadPhoto(File pickedPhoto) : super(pickedPhoto: pickedPhoto);
}
