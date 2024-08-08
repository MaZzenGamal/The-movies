import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies/core/utiles/enums.dart';
import 'package:the_movies/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:the_movies/movies/domain/usecase/get_popular_movies.dart';
import 'package:the_movies/movies/domain/usecase/get_top_rated_movies.dart';
import 'package:the_movies/movies/presentation/controller/movies_event.dart';
import 'package:the_movies/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingEvent>(_getNowPlaying);
    on<GetPopularEvent>(_getPopular);
    on<GetTopRatedEvent>(_getTopRated);
  }

  FutureOr<void> _getNowPlaying(
      GetNowPlayingEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase();
    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
        (r) => emit(state.copyWith(
            nowPlayingMovies: r, nowPlayingState: RequestState.success)));
  }

  FutureOr<void> _getPopular(
      GetPopularEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase();
    result.fold(
        (l) => emit(state.copyWith(
            popularState: RequestState.error, popularMessage: l.message)),
        (r) => emit(state.copyWith(
            popularMovies: r, popularState: RequestState.success)));
  }

  FutureOr<void> _getTopRated(GetTopRatedEvent event, Emitter<MoviesState> emit) async{
    final result = await getTopRatedMoviesUseCase();
    result.fold(
            (l) => emit(state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: l.message)),
            (r) => emit(state.copyWith(
            topRatedMovies: r, topRatedState: RequestState.success)));
  }
}
