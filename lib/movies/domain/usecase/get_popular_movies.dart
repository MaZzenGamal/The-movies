import 'package:dartz/dartz.dart';
import 'package:the_movies/core/usecases/base_usecase.dart';
import 'package:the_movies/movies/domain/entities/movies.dart';
import 'package:the_movies/movies/domain/repository/base_movie_repo.dart';

import '../../../core/error/failure.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movies>>{
  final BaseMovieRepo baseMovieRepo;

  GetPopularMoviesUseCase(this.baseMovieRepo);

  @override
  Future<Either<Failure, List<Movies>>> call() async{
    return await baseMovieRepo.getPopularMovies();

  }

}
