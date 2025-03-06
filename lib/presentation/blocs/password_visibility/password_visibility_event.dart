import 'package:equatable/equatable.dart';

abstract class PasswordVisibilityEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TogglePasswordVisibility extends PasswordVisibilityEvent {}
