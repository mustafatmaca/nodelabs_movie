import 'package:equatable/equatable.dart';

abstract class FavoriteMoviesEvent extends Equatable {
  const FavoriteMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetFavoriteMovies extends FavoriteMoviesEvent {}
