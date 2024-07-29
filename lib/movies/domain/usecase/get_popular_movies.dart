import 'package:dartz/dartz.dart';
import 'package:the_movies/movies/domain/entities/movies.dart';
import 'package:the_movies/movies/domain/repository/base_movie_repo.dart';

import '../../../core/error/failure.dart';

class GetPopularMovies {
  final BaseMovieRepo baseMovieRepo;

  GetPopularMovies(this.baseMovieRepo);

  Future<Either<Failure, List<Movies>>> execute() async {
    return await baseMovieRepo.getPopularMovies();
  }
}
