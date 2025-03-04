import 'package:get_it/get_it.dart';
import 'package:nodelabs_movie/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerFactory<BottomNavigationBloc>(() => BottomNavigationBloc());
}
