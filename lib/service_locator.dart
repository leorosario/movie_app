import 'package:get_it/get_it.dart';
import 'package:movie_app/data/movie_api.dart';

final getIt = GetIt.instance;

void setupGetIt(){
  getIt.registerLazySingleton<MovieApi>(() => MovieApi());
}