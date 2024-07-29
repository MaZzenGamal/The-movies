class AppConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'a67ea0d08d743eb09ead9b383a61d3bc';

  static const String nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';

  static const String nowPopularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';

  static const String nowTopRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';
}
