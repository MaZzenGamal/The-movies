import 'package:the_movies/movies/domain/entities/movies.dart';

abstract class BaseMovieRepo {
  Future<List<Movies>> getNowPlaying();

  Future<List<Movies>> getPopularMovies();

  Future<List<Movies>> getRatedMovies();
}
