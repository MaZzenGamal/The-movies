import 'package:dartz/dartz.dart';
import 'package:the_movies/core/usecases/base_usecase.dart';
import 'package:the_movies/movies/domain/entities/movies.dart';
import 'package:the_movies/movies/domain/repository/base_movie_repo.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movies>,NoParameters>{
  final BaseMovieRepo baseMovieRepo;

  GetNowPlayingMoviesUseCase(this.baseMovieRepo);

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async{
    return await baseMovieRepo.getNowPlayingMovies();

  }

}
