import 'package:nodelabs_movie/core/resources/data_state.dart';
import 'package:nodelabs_movie/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<DataState<List<MovieEntity>>> getFavoriteMovies();
}
