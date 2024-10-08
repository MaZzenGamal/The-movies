import 'package:dio/dio.dart';
import 'package:the_movies/core/error/exceptions.dart';
import 'package:the_movies/core/network/error_message_model.dart';
import 'package:the_movies/core/utiles/app_constants.dart';
import 'package:the_movies/movies/data/models/movie_model.dart';

abstract class BaseRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();
}

class RemoteDataSource extends BaseRemoteDataSource {
  final dio = Dio();

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await dio.get(ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      List<MovieModel> movies = [];
      for (var item in response.data['results']) {
        movies.add(MovieModel.fromJson(item));
      }
      return movies;
      // return List<MovieModel>.from((response.data['results'] as List)
      //     .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await dio.get(ApiConstants.nowPopularMoviesPath);

    if (response.statusCode == 200) {
      List<MovieModel> movies =[];
      for(var item in response.data['results']){
        movies.add(MovieModel.fromJson(item));
      }
      return movies;
      // return List<MovieModel>.from((response.data['results'] as List)
      //     .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await dio.get(ApiConstants.nowTopRatedMoviesPath);

    if (response.statusCode == 200) {

      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
