import 'package:the_movies/movies/domain/entities/movies.dart';

class MovieModel extends Movies {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.overview,
      required super.voteAverage,
      required super.genreIds,
      required super.releaseDate});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        overview: json['overview'],


        /// TODO : CHECK THIS
        voteAverage: json['vote_average'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        releaseDate: json['release_date'],
      );
}
