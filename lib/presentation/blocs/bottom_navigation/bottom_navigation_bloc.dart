import 'package:bloc/bloc.dart';
import 'package:nodelabs_movie/presentation/blocs/bottom_navigation/bottom_navigation_event.dart';
import 'package:nodelabs_movie/presentation/blocs/bottom_navigation/bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(const PageChanged(0)) {
    on<ChangePage>((event, emit) {
      emit(PageChanged(event.currentIndex));
    });
  }
}
