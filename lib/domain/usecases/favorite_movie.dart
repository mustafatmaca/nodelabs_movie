import 'package:nodelabs_movie/core/resources/data_state.dart';
import 'package:nodelabs_movie/core/usecase/usecase.dart';
import 'package:nodelabs_movie/domain/repository/movie_repository.dart';

class FavoriteMovieUseCase implements UseCase<DataState<bool>, String> {
  final MovieRepository _movieRepository;

  FavoriteMovieUseCase(this._movieRepository);

  @override
  Future<DataState<bool>> call({String? params}) {
    return _movieRepository.favoriteMovie(params!);
  }
}
