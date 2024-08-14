import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_movies/core/error/failure.dart';
import 'package:the_movies/core/usecases/base_usecase.dart';
import 'package:the_movies/movies/domain/entities/movie_details.dart';
import 'package:the_movies/movies/domain/repository/base_movie_repo.dart';

class GetMovieDetails
    extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMovieRepo baseMovieRepo;

  GetMovieDetails(this.baseMovieRepo);

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParameters parameters) async {
    return await baseMovieRepo.getMovieDetails();
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
