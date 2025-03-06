import 'package:equatable/equatable.dart';

abstract class GetMoviesEvent extends Equatable {
  final int? page;
  final int? index;

  const GetMoviesEvent({this.page, this.index});

  @override
  List<Object> get props => [page!, index!];
}

class GetMovies extends GetMoviesEvent {
  const GetMovies(int page) : super(page: page);

  @override
  List<Object> get props => [page!];
}

class IsLastMovie extends GetMoviesEvent {
  const IsLastMovie(int index) : super(index: index);

  @override
  List<Object> get props => [index!];
}

class RefreshMovies extends GetMoviesEvent {}
