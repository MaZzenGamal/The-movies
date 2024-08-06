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

    on<GetNowPlayingEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      result.fold(
          (l) => emit(MoviesState(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message)),
          (r) => emit(MoviesState(
              nowPlayingMovies: r, nowPlayingState: RequestState.success)));
    });

    on<GetPopularEvent>((event,emit)async{
      final result = await getPopularMoviesUseCase.execute();
      result.fold(
              (l) => emit(MoviesState(
              popularState: RequestState.error,
              popularMessage: l.message)),
              (r) => emit(MoviesState(
              popularMovies: r, popularState: RequestState.success)));



    });


  }
}
