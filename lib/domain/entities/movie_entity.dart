import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String? id;
  final String? title;
  final String? plot;
  final String? poster;
  final String? year;
  final List<dynamic>? images;
  final bool? isFavorite;

  const MovieEntity({
    this.id,
    this.title,
    this.plot,
    this.poster,
    this.year,
    this.images,
    this.isFavorite,
  });

  @override
  List<Object?> get props {
    return [
      id,
      title,
      plot,
      poster,
      year,
      images,
      isFavorite,
    ];
  }
}
