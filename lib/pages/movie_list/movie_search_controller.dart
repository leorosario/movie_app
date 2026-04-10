import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/data/movie_api.dart';
import 'package:movie_app/service_locator.dart';

class MovieSearchController {
  final api = getIt<MovieApi>();
  Future<List<Movie>> searchMovie(String query) => api.searchMovie(query);
}
