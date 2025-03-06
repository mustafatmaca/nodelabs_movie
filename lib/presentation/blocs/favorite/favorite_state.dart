import 'package:equatable/equatable.dart';

abstract class FavoriteState extends Equatable {
  final bool? isFavorite;

  const FavoriteState({this.isFavorite});

  @override
  List<Object> get props => [isFavorite!];
}

final class FavoriteInitial extends FavoriteState {}

final class IsFavorite extends FavoriteState {
  const IsFavorite(bool isFavorite) : super(isFavorite: isFavorite);

  @override
  List<Object> get props => [isFavorite!];
}
