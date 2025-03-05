import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:nodelabs_movie/domain/entities/movie_entity.dart';

abstract class FavoriteMoviesState extends Equatable {
  final List<MovieEntity>? favoriteMovies;
  final DioException? error;

  const FavoriteMoviesState({this.favoriteMovies, this.error});

  @override
  List<Object> get props => [favoriteMovies!, error!];
}

final class FavoriteMoviesInitial extends FavoriteMoviesState {}

final class FavoriteMoviesLoaded extends FavoriteMoviesState {
  const FavoriteMoviesLoaded(List<MovieEntity> favoriteMovies)
      : super(favoriteMovies: favoriteMovies);

  @override
  List<Object> get props => [favoriteMovies!];
}

final class FavoriteMoviesFailed extends FavoriteMoviesState {
  const FavoriteMoviesFailed(DioException error) : super(error: error);

  @override
  List<Object> get props => [error!];
}
