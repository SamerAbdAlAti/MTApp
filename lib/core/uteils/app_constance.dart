class AppConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "7e5209fc738fa1cc4dfe995a8e91dfae";

  static const String getNowPlayingUrl =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String getTopRatedUrl =
      "$baseUrl/movie/top_rated?api_key=$apiKey";
  static const String getPopularUrl = "$baseUrl/movie/popular?api_key=$apiKey";
  static const String getMovieDetails = "$baseUrl/movie/436270?api_key=$apiKey";

  static imageCompletePathUrl({required String path}) =>
      "https://image.tmdb.org/t/p/original$path";

  /// //////////////////////////////////////////////////////////////////////////////////////////////////Tv Section

  static const String getTvTopRated = "$baseUrl/tv/top_rated?api_key=$apiKey";
  static const String getTvPopular = "$baseUrl/tv/popular?api_key=$apiKey";
}
//https://api.themoviedb.org/3/movie/popular?api_key=7e5209fc738fa1cc4dfe995a8e91dfae
