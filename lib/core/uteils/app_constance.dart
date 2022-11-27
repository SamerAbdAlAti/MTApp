class AppConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "7e5209fc738fa1cc4dfe995a8e91dfae";

  static const String getNowPlayingUrl =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String getTopRatedUrl =
      "$baseUrl/movie/top_rated?api_key=$apiKey";
  static const String getPopularUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=7e5209fc738fa1cc4dfe995a8e91dfae";
  static const String getMovieDetails =
      "https://api.themoviedb.org/3/movie/436270?api_key=7e5209fc738fa1cc4dfe995a8e91dfae";

  static imageCompletePathUrl({required String path}) =>
      "https://image.tmdb.org/t/p/original$path";

//https://api.themoviedb.org/3/movie/popular?api_key=7e5209fc738fa1cc4dfe995a8e91dfae
}
