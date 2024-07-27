import 'package:the_movies/movies/domain/entities/movies.dart';
import 'package:the_movies/movies/domain/repository/base_movie_repo.dart';

class GetTopRatedMovies {
  final BaseMovieRepo baseMovieRepo;

  GetTopRatedMovies(this.baseMovieRepo);

  Future<List<Movies>> execute() async {
    return await baseMovieRepo.getRatedMovies();
  }
}
