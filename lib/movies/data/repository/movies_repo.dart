import 'package:dartz/dartz.dart';
import 'package:the_movies/core/error/exceptions.dart';
import 'package:the_movies/core/error/failure.dart';
import 'package:the_movies/movies/data/data_source/remote_data_source.dart';
import 'package:the_movies/movies/domain/entities/movie_details.dart';
import 'package:the_movies/movies/domain/entities/movies.dart';
import 'package:the_movies/movies/domain/repository/base_movie_repo.dart';

class MoviesRepo extends BaseMovieRepo {
  final BaseRemoteDataSource baseRemoteDataSource;

  MoviesRepo(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies() async {
    final result = await baseRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final result = await baseRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getRatedMovies() async {
    final result = await baseRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails() {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }
}
