import 'package:equatable/equatable.dart';
import 'package:the_movies/core/utiles/enums.dart';
import 'package:the_movies/movies/domain/entities/movies.dart';

class MoviesState extends Equatable {
  final List<Movies> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movies> popularMovies;
  final RequestState popularState;
  final String popularMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
  });

  @override
  List<Object> get props =>
      [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularMovies,
        popularState,
        popularMessage,
      ];
}
