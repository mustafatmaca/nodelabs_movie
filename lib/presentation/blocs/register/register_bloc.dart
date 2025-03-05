import 'package:bloc/bloc.dart';
import 'package:nodelabs_movie/core/resources/data_state.dart';
import 'package:nodelabs_movie/domain/usecases/register.dart';
import 'package:nodelabs_movie/presentation/blocs/register/register_event.dart';
import 'package:nodelabs_movie/presentation/blocs/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;
  RegisterBloc(this._registerUseCase) : super(RegisterInitial()) {
    on<Register>((event, emit) async {
      final dataState = await _registerUseCase(params: {
        'name': event.name,
        'email': event.email,
        'password': event.password
      });

      if (dataState is DataSuccess && dataState.data != null) {
        emit(RegisterSuccess(dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(RegisterFailed(dataState.error!));
      }
    });
  }
}
