class API{
  static String movies = '/movies';
  static String top_movies = movies + '/top_movies';
  static String genres = '/genres';
  static String tv_genres = '/genres_tv';
  static String search = '/search/';
  static String search_tmdb_movie = search + 'tmdb_movie/';
  static String search_tmdb_tv = search + 'tmdb_tv/';
  static String tv = '/tv';
  static String top_tv = tv + '/top_tv';
  static String tv_recommendations = tv + '/recommendations';
  static String movie_recommendations = movies + '/recommendations';
  static String users = '/users';
  static String users_exists = users + '/exists/';
  static String inaccurate_data = '/inaccurate_data/';
  static String broken_link = '/broken_link';
  static String inaccurate_recom = '/inaccurate_recom/';
  static String broken_links = '/broken_links';
  static String inaccurate_data_get_latest = inaccurate_data + 'get_latest';
  static String inaccurate_recommendations = '/inaccurate_recommendations/';
  static String movie_movie = '/movie_movie';
  static String movie_tv = '/movie_tv';
  static String tv_tv = '/tv_tv';
  static String toggle_validation = '/toggle_validation/';
  static String like = '/like/';
  static String dislike = '/dislike/';
  static String recommend_movies = '/recommend_movies/';
  static String recommend_tv   = '/recommend_tv/';
  static String missing_title = '/missing_title/';
  static String create_movie_from_tmdb = movies + '/' + 'create_from_tmdb/';
  static String create_tv_from_tmdb = tv + '/' + 'create_from_tmdb/';
  static String credential_login = users + '/login/';
  static String my_list = '/my_list/';
  static String books = '/books';
}