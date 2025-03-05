// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final String? photoUrl;

  const UserEntity({
    this.id,
    this.name,
    this.email,
    this.photoUrl,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      photoUrl,
    ];
  }
}
