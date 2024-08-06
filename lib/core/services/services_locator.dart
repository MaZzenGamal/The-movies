import 'package:get_it/get_it.dart';
import 'package:the_movies/movies/data/data_source/remote_data_source.dart';
import 'package:the_movies/movies/data/repository/movies_repo.dart';
import 'package:the_movies/movies/domain/repository/base_movie_repo.dart';
import 'package:the_movies/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:the_movies/movies/domain/usecase/get_popular_movies.dart';
import 'package:the_movies/movies/domain/usecase/get_top_rated_movies.dart';
import 'package:the_movies/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// BLOC

    sl.registerFactory(() => MoviesBloc(
          sl(),
          sl(),
          sl(),
        ));

    ///USE CASE
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    /// REPOSITORY
    sl.registerLazySingleton<BaseMovieRepo>(() => MoviesRepo(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
  }
}
