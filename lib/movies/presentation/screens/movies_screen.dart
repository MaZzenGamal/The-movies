import 'package:flutter/material.dart';
import 'package:the_movies/movies/data/data_source/remote_data_source.dart';
import 'package:the_movies/movies/data/repository/movies_repo.dart';
import 'package:the_movies/movies/domain/repository/base_movie_repo.dart';
import 'package:the_movies/movies/domain/usecase/get_now_playing_movies.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
    BaseMovieRepo baseMovieRepo = MoviesRepo(baseRemoteDataSource);
   final result =  await GetNowPlayingMovies(baseMovieRepo).execute();
   print(result);
  }
}
