import 'dart:async';

import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/data/movie_api.dart';
import 'package:movie_app/service_locator.dart';

class MovieListController {
  final api = getIt<MovieApi>();

  final _controller = StreamController<List<Movie>>();
  Stream<List<Movie>> get stream => _controller.stream;

  void init(){
    getMovies();
  }

  Future<void> getMovies() async{
    var result = await api.getMovies();
    print("TesteTesteTesteTesteTesteTesteTesteTesteTesteTeste");
    print("$result Teste");
    _controller.sink.add(result);
  }
}