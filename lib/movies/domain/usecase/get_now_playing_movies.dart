import 'package:the_movies/movies/domain/entities/movies.dart';
import 'package:the_movies/movies/domain/repository/base_movie_repo.dart';

class GetNowPlayingMovies {
  final BaseMovieRepo baseMovieRepo;

  GetNowPlayingMovies(this.baseMovieRepo);

  Future<List<Movies>> execute() async {
    return await baseMovieRepo.getNowPlaying();
  }
}
