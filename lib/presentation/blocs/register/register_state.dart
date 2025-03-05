import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:nodelabs_movie/domain/entities/user_entity.dart';

abstract class RegisterState extends Equatable {
  final UserEntity? user;
  final DioException? error;

  const RegisterState({
    this.user,
    this.error,
  });

  @override
  List<Object> get props => [user!, error!];
}

final class RegisterInitial extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  const RegisterSuccess(UserEntity user) : super(user: user);
}

final class RegisterFailed extends RegisterState {
  const RegisterFailed(DioException error) : super(error: error);
}
