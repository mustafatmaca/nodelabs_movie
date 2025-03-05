import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:nodelabs_movie/domain/entities/user_entity.dart';

abstract class LoginState extends Equatable {
  final UserEntity? user;
  final DioException? error;

  const LoginState({
    this.user,
    this.error,
  });

  @override
  List<Object> get props => [user!, error!];
}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {
  const LoginSuccess(UserEntity user) : super(user: user);
}

final class LoginFailed extends LoginState {
  const LoginFailed(DioException error) : super(error: error);
}
