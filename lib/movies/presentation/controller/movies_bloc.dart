import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies/core/utiles/enums.dart';
import 'package:the_movies/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:the_movies/movies/presentation/controller/movies_event.dart';
import 'package:the_movies/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesState()) {
    on<GetNowPlayingEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      result.fold(
          (l) => emit(MoviesState(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message)),
          (r) => emit(MoviesState(
              nowPlayingMovies: r, nowPlayingState: RequestState.success)));
    });
  }
}
