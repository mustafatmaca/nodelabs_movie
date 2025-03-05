import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:nodelabs_movie/domain/entities/movie_entity.dart';

abstract class GetMoviesState extends Equatable {
  final List<MovieEntity>? movies;
  final int? page;
  final DioException? error;

  const GetMoviesState({this.movies, this.page, this.error});

  @override
  List<Object> get props => [movies!, page!, error!];
}

final class GetMoviesInitial extends GetMoviesState {}

final class GetMoviesLoaded extends GetMoviesState {
  const GetMoviesLoaded(List<MovieEntity> movies, int page)
      : super(movies: movies, page: page);

  @override
  List<Object> get props => [movies!, page!];
}

final class GetMoviesFailed extends GetMoviesState {
  const GetMoviesFailed(DioException error) : super(error: error);

  @override
  List<Object> get props => [error!];
}
