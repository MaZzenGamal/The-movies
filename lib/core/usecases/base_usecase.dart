import 'package:dartz/dartz.dart';
import 'package:the_movies/core/error/failure.dart';
import 'package:the_movies/movies/domain/entities/movies.dart';

abstract class BaseUseCase<T>{

 Future<Either<Failure,T>> call();
}