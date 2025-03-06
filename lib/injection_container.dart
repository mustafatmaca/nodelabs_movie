import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:nodelabs_movie/data/data_sources/remote/movie_services.dart';
import 'package:nodelabs_movie/data/data_sources/remote/user_services.dart';
import 'package:nodelabs_movie/data/repository/movie_repository_impl.dart';
import 'package:nodelabs_movie/data/repository/user_repository_impl.dart';
import 'package:nodelabs_movie/domain/repository/movie_repository.dart';
import 'package:nodelabs_movie/domain/repository/user_repository.dart';
import 'package:nodelabs_movie/domain/usecases/get_favorite_movies.dart';
import 'package:nodelabs_movie/domain/usecases/get_movies.dart';
import 'package:nodelabs_movie/domain/usecases/login.dart';
import 'package:nodelabs_movie/domain/usecases/register.dart';
import 'package:nodelabs_movie/domain/usecases/upload_photo.dart';
import 'package:nodelabs_movie/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:nodelabs_movie/presentation/blocs/favorite_movies/favorite_movies_bloc.dart';
import 'package:nodelabs_movie/presentation/blocs/get_movies/get_movies_bloc.dart';
import 'package:nodelabs_movie/presentation/blocs/login/login_bloc.dart';
import 'package:nodelabs_movie/presentation/blocs/password_visibility/password_visibility_bloc.dart';
import 'package:nodelabs_movie/presentation/blocs/register/register_bloc.dart';
import 'package:nodelabs_movie/presentation/blocs/upload_photo/upload_photo_bloc.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());

  getIt.registerSingleton<UserServices>(UserServices(getIt(), getIt()));

  getIt.registerSingleton<MovieServices>(MovieServices(getIt(), getIt()));

  getIt.registerSingleton<UserRepository>(UserRepositoryImpl(getIt()));

  getIt.registerSingleton<MovieRepository>(MovieRepositoryImpl(getIt()));

  getIt.registerSingleton(LoginUseCase(getIt()));

  getIt.registerSingleton(RegisterUseCase(getIt()));

  getIt.registerSingleton(UploadPhotoUseCase(getIt()));

  getIt.registerSingleton(GetFavoriteMoviesUseCase(getIt()));

  getIt.registerSingleton(GetMoviesUseCase(getIt()));

  getIt.registerFactory<PasswordVisibilityBloc>(() => PasswordVisibilityBloc());

  getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt()));

  getIt.registerFactory<RegisterBloc>(() => RegisterBloc(getIt()));

  getIt.registerFactory<UploadPhotoBloc>(() => UploadPhotoBloc(getIt()));

  getIt.registerFactory<FavoriteMoviesBloc>(() => FavoriteMoviesBloc(getIt()));

  getIt.registerFactory<GetMoviesBloc>(() => GetMoviesBloc(getIt()));

  getIt.registerFactory<BottomNavigationBloc>(() => BottomNavigationBloc());
}
