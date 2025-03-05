import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_movie/config/theme/app_color.dart';
import 'package:nodelabs_movie/config/theme/app_theme.dart';
import 'package:nodelabs_movie/presentation/blocs/get_movies/get_movies_bloc.dart';
import 'package:nodelabs_movie/presentation/blocs/get_movies/get_movies_event.dart';
import 'package:nodelabs_movie/presentation/blocs/get_movies/get_movies_state.dart';
import 'package:nodelabs_movie/presentation/widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  int page = 1;
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetMoviesBloc, GetMoviesState>(
        builder: (context, state) {
          if (state is GetMoviesInitial) {
            context.read<GetMoviesBloc>().add(GetMovies(page));
          }
          if (state is GetMoviesLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<GetMoviesBloc>().add(GetMovies(page));
              },
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                itemCount: state.movies!.length,
                itemBuilder: (context, index) {
                  return MovieCard(
                    movie: state.movies![index],
                  );
                },
                onPageChanged: (value) {
                  context.read<GetMoviesBloc>().add(IsLastMovie(value));
                },
              ),
            );
          }
          if (state is GetMoviesFailed) {
            Center(
              child: Text(
                'Bir hata oluştu!',
                style: AppTheme.theme.textTheme.headlineLarge,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.primary,
            ),
          );
        },
      ),
    );
  }
}
