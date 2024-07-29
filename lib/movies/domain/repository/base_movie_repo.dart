import 'package:dartz/dartz.dart';
import 'package:the_movies/movies/domain/entities/movies.dart';

import '../../../core/error/failure.dart';

abstract class BaseMovieRepo {
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movies>>> getPopularMovies();

  Future<Either<Failure, List<Movies>>> getRatedMovies();
}
