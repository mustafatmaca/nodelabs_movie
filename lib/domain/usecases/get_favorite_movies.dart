import 'package:nodelabs_movie/core/resources/data_state.dart';
import 'package:nodelabs_movie/core/usecase/usecase.dart';
import 'package:nodelabs_movie/domain/entities/movie_entity.dart';
import 'package:nodelabs_movie/domain/repository/movie_repository.dart';

class GetFavoriteMoviesUseCase
    implements UseCase<DataState<List<MovieEntity>>, void> {
  final MovieRepository _movieRepository;

  GetFavoriteMoviesUseCase(this._movieRepository);

  @override
  Future<DataState<List<MovieEntity>>> call({void params}) {
    return _movieRepository.getFavoriteMovies();
  }
}
