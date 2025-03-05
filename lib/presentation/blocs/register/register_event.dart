import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  final String? name;
  final String? email;
  final String? password;

  const RegisterEvent({this.name, this.email, this.password});

  @override
  List<Object> get props => [name!, email!, password!];
}

class Register extends RegisterEvent {
  const Register(String name, String email, String password)
      : super(name: name, email: email, password: password);

  @override
  List<Object> get props => [name!, email!, password!];
}
