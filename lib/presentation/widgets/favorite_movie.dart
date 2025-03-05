import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nodelabs_movie/config/theme/app_theme.dart';
import 'package:nodelabs_movie/domain/entities/movie_entity.dart';

class FavoriteMovie extends StatelessWidget {
  final MovieEntity movie;
  const FavoriteMovie({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: movie.poster != null
              ? Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(movie.poster!)),
                      color: Color(0x1AFFFFFF),
                      borderRadius: BorderRadius.circular(18)),
                )
              : Container(
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
              Text(movie.title != null ? movie.title! : 'Başlık Bulunamadı',
                  style: AppTheme.theme.textTheme.headlineLarge),
              Text(movie.year != null ? movie.year! : 'Değer Bulunamadı',
                  style: AppTheme.theme.textTheme.labelMedium),
            ],
          ),
        ),
      ],
    );
  }
}
