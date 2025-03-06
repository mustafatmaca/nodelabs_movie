import 'package:bloc/bloc.dart';
import 'package:nodelabs_movie/core/resources/data_state.dart';
import 'package:nodelabs_movie/domain/entities/movie_entity.dart';
import 'package:nodelabs_movie/domain/usecases/get_movies.dart';
import 'package:nodelabs_movie/presentation/blocs/get_movies/get_movies_event.dart';
import 'package:nodelabs_movie/presentation/blocs/get_movies/get_movies_state.dart';

class GetMoviesBloc extends Bloc<GetMoviesEvent, GetMoviesState> {
  final GetMoviesUseCase _getMoviesUseCase;
  GetMoviesBloc(this._getMoviesUseCase) : super(GetMoviesInitial()) {
    on<GetMovies>((event, emit) async {
      final dataState = await _getMoviesUseCase(params: event.page);

      if (dataState is DataSuccess && dataState.data != null) {
        emit(GetMoviesLoaded(dataState.data!, 1));
      }

      if (dataState is DataFailed) {
        emit(GetMoviesFailed(dataState.error!));
      }
    });

    on<IsLastMovie>((event, emit) async {
      if (state is GetMoviesLoaded) {
        if (state.movies!.length - 1 == event.index) {
          print('Yenileniyor.');
          final newList = (state as GetMoviesLoaded).movies;
          final dataState = await _getMoviesUseCase(
              params: (state as GetMoviesLoaded).page! + 1);

          newList!.addAll(dataState.data!);

          emit(GetMoviesLoaded(newList, (state as GetMoviesLoaded).page! + 1));
        }
      }
    });

    on<RefreshMovies>(
      (event, emit) async {
        if (state is GetMoviesLoaded) {
          final List<MovieEntity>? newList = [];

          for (var i = 1; i <= (state.page)!; i++) {
            final dataState = await _getMoviesUseCase(params: i);
            newList!.addAll(dataState.data!);
          }

          emit(GetMoviesLoaded(newList!, state.page!));
        }
      },
    );
  }
}
