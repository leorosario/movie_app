import 'package:dio/dio.dart';

class MovieApi{
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://apifilmes.webevolui.com')
  );

  Future<List> getMovies() async {
    return List.empty();
  }
}