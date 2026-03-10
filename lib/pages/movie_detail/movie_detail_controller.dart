import 'dart:async';

import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/data/movie_api.dart';
import 'package:movie_app/service_locator.dart';

class MovieDetailController {
  final api = getIt<MovieApi>();

  final _controller = StreamController<Movie>();
  Stream<Movie> get stream => _controller.stream;

  late Movie _movie;

  void init(Movie movie){
    _movie = movie;
    getMovie();
  }

  Future<void> getMovie() async{
    var result = await api.getMovie(_movie.id);    
    _controller.sink.add(result);
  }
}