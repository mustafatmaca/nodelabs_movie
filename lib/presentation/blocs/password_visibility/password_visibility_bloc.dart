import 'package:bloc/bloc.dart';
import 'package:nodelabs_movie/presentation/blocs/password_visibility/password_visibility_event.dart';
import 'package:nodelabs_movie/presentation/blocs/password_visibility/password_visibility_state.dart';

class PasswordVisibilityBloc
    extends Bloc<PasswordVisibilityEvent, PasswordVisibilityState> {
  PasswordVisibilityBloc() : super(const PasswordVisibility(false)) {
    on<TogglePasswordVisibility>((event, emit) {
      emit(PasswordVisibility(!state.isVisible));
    });
  }
}
