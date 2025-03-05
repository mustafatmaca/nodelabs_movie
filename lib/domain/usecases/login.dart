import 'package:nodelabs_movie/core/resources/data_state.dart';
import 'package:nodelabs_movie/core/usecase/usecase.dart';
import 'package:nodelabs_movie/domain/entities/user_entity.dart';
import 'package:nodelabs_movie/domain/repository/user_repository.dart';

class LoginUseCase
    implements UseCase<DataState<UserEntity>, Map<String, dynamic>> {
  final UserRepository _userRepository;

  LoginUseCase(this._userRepository);

  @override
  Future<DataState<UserEntity>> call({Map<String, dynamic>? params}) {
    return _userRepository.login(params);
  }
}
