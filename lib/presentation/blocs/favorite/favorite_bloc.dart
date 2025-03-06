import 'package:bloc/bloc.dart';
import 'package:nodelabs_movie/core/resources/data_state.dart';
import 'package:nodelabs_movie/domain/usecases/favorite_movie.dart';
import 'package:nodelabs_movie/presentation/blocs/favorite/favorite_event.dart';
import 'package:nodelabs_movie/presentation/blocs/favorite/favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteMovieUseCase _favoriteMovieUseCase;
  FavoriteBloc(this._favoriteMovieUseCase) : super(FavoriteInitial()) {
    on<Favorite>((event, emit) async {
      final dataState = await _favoriteMovieUseCase(params: event.movieId);

      if (dataState is DataSuccess && dataState.data != null) {
        emit(IsFavorite(dataState.data!));
      }
    });
  }
}
