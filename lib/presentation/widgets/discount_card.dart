import 'package:flutter/material.dart';
import 'package:nodelabs_movie/config/theme/app_theme.dart';

class DiscountCard extends StatelessWidget {
  final String firstJeton;
  final String secondJeton;
  final String price;
  final String discount;
  final List<Color> gradient;
  final Color discountColor;
  const DiscountCard({
    super.key,
    required this.firstJeton,
    required this.secondJeton,
    required this.price,
    required this.discount,
    required this.gradient,
    required this.discountColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 0.28,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: gradient),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.white54,
                  width: 0.8,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Column(
                      children: [
                        Text(firstJeton,
                            style: AppTheme.theme.textTheme.headlineMedium),
                        Text(secondJeton,
                            style: AppTheme.theme.textTheme.displayLarge),
                        Text('Jeton',
                            style: AppTheme.theme.textTheme.headlineLarge),
                      ],
                    ),
                    Column(
                      children: [
                        Text(price,
                            style: AppTheme.theme.textTheme.headlineLarge),
                        Text(
                          'Başına haftalık',
                          style: AppTheme.theme.textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: 30,
          child: Container(
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
              top: 1,
              bottom: 1,
            ),
            decoration: BoxDecoration(
              color: discountColor,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.white54,
                width: 0.8,
              ),
            ),
            child: Text(
              discount,
              style: AppTheme.theme.textTheme.labelLarge,
            ),
          ),
        ),
      ],
    );
  }
}
