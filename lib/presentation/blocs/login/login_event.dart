import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  final String? email;
  final String? password;

  const LoginEvent({this.email, this.password});

  @override
  List<Object> get props => [email!, password!];
}

class Login extends LoginEvent {
  const Login(String email, String password)
      : super(email: email, password: password);

  @override
  List<Object> get props => [email!, password!];
}
