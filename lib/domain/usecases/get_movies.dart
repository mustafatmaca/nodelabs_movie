import 'package:nodelabs_movie/core/resources/data_state.dart';
import 'package:nodelabs_movie/core/usecase/usecase.dart';
import 'package:nodelabs_movie/domain/entities/movie_entity.dart';
import 'package:nodelabs_movie/domain/repository/movie_repository.dart';

class GetMoviesUseCase implements UseCase<DataState<List<MovieEntity>>, int> {
  final MovieRepository _movieRepository;

  GetMoviesUseCase(this._movieRepository);

  @override
  Future<DataState<List<MovieEntity>>> call({int? params}) {
    return _movieRepository.getMovies(params!);
  }
}
