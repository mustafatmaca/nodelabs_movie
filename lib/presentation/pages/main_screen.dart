import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_movie/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:nodelabs_movie/presentation/blocs/bottom_navigation/bottom_navigation_event.dart';
import 'package:nodelabs_movie/presentation/blocs/bottom_navigation/bottom_navigation_state.dart';
import 'package:nodelabs_movie/presentation/pages/home_screen.dart';
import 'package:nodelabs_movie/presentation/pages/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentIndex,
            onTap: (value) {
              context.read<BottomNavigationBloc>().add(ChangePage(value));
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Anasayfa',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
          ),
          body: state.currentIndex == 0
              ? HomeScreen()
              : state.currentIndex == 1
                  ? const ProfileScreen()
                  : const Center(
                      child: Text("Other Pages"),
                    ),
        );
      },
    );
  }
}
