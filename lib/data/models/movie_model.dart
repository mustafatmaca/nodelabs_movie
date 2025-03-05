import 'dart:convert';

import 'package:nodelabs_movie/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    String? id,
    String? title,
    String? plot,
    String? poster,
    String? year,
    List<dynamic>? images,
    bool? isFavorite,
  }) : super(
            id: id,
            title: title,
            plot: plot,
            poster: poster,
            year: year,
            images: images,
            isFavorite: isFavorite);

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'],
      title: map['Title'],
      plot: map['Plot'],
      poster: map['Poster'],
      year: map['Year'],
      images: map['Images'],
      isFavorite: map['isFavorite'],
    );
  }

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory MovieModel.fromEntity(MovieEntity entity) {
    return MovieModel(
      id: entity.id,
      title: entity.title,
      plot: entity.plot,
      poster: entity.poster,
      year: entity.year,
      images: entity.images,
      isFavorite: entity.isFavorite,
    );
  }
}
