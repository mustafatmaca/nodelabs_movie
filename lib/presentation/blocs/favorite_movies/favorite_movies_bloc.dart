import 'package:bloc/bloc.dart';
import 'package:nodelabs_movie/core/resources/data_state.dart';
import 'package:nodelabs_movie/domain/usecases/get_favorite_movies.dart';
import 'package:nodelabs_movie/presentation/blocs/favorite_movies/favorite_movies_event.dart';
import 'package:nodelabs_movie/presentation/blocs/favorite_movies/favorite_movies_state.dart';

class FavoriteMoviesBloc
    extends Bloc<FavoriteMoviesEvent, FavoriteMoviesState> {
  final GetFavoriteMoviesUseCase _getFavoriteMoviesUseCase;
  FavoriteMoviesBloc(this._getFavoriteMoviesUseCase)
      : super(FavoriteMoviesInitial()) {
    on<GetFavoriteMovies>((event, emit) async {
      final dataState = await _getFavoriteMoviesUseCase();

      if (dataState is DataSuccess && dataState.data != null) {
        emit(FavoriteMoviesLoaded(dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(FavoriteMoviesFailed(dataState.error!));
      }
    });
  }
}
