import 'package:bloc/bloc.dart';
import 'package:nodelabs_movie/core/resources/data_state.dart';
import 'package:nodelabs_movie/domain/usecases/login.dart';
import 'package:nodelabs_movie/presentation/blocs/login/login_event.dart';
import 'package:nodelabs_movie/presentation/blocs/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  LoginBloc(this._loginUseCase) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      final dataState = await _loginUseCase(
          params: {'email': event.email, 'password': event.password});

      if (dataState is DataSuccess && dataState.data != null) {
        emit(LoginSuccess(dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(LoginFailed(dataState.error!));
      }
    });
  }
}
