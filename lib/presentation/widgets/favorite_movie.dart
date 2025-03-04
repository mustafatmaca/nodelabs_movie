import 'package:flutter/material.dart';
import 'package:nodelabs_movie/config/theme/app_theme.dart';

class FavoriteMovie extends StatelessWidget {
  const FavoriteMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Color(0x1AFFFFFF),
                borderRadius: BorderRadius.circular(18)),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.only(left: 6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Beğendiğim Filmler",
                  style: AppTheme.theme.textTheme.headlineLarge),
              Text("Beğendiğim Filmler",
                  style: AppTheme.theme.textTheme.labelMedium),
            ],
          ),
        ),
      ],
    );
  }
}
