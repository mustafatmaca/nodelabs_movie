import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable {
  final String? movieId;

  const FavoriteEvent({this.movieId});

  @override
  List<Object> get props => [movieId!];
}

class Favorite extends FavoriteEvent {
  const Favorite(String movieId) : super(movieId: movieId);

  @override
  List<Object> get props => [movieId!];
}
