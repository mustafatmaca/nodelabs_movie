import 'package:equatable/equatable.dart';

abstract class PasswordVisibilityState extends Equatable {
  final bool isVisible;

  const PasswordVisibilityState({required this.isVisible});

  @override
  List<Object> get props => [];
}

final class PasswordVisibility extends PasswordVisibilityState {
  const PasswordVisibility(bool isVisible) : super(isVisible: isVisible);

  @override
  List<Object> get props => [isVisible];
}
