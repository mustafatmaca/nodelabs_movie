import 'package:flutter/material.dart';
import 'package:nodelabs_movie/presentation/widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: (context, index) {
          return MovieCard();
        },
      ),
    );
  }
}
