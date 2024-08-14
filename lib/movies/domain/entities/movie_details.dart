import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final String name;
  final String overview;
  final String releaseDate;
  final int runtime;

  ///STRING
  final double voteAverage;

  const MovieDetails(
      {required this.backdropPath,
      required this.id,
      required this.genres,
      required this.name,
      required this.overview,
      required this.releaseDate,
      required this.runtime,
      required this.voteAverage});

  @override
  List<Object> get props => [
        backdropPath,
        id,
        genres,
        name,
        overview,
        releaseDate,
        runtime,
        voteAverage,
      ];
}
