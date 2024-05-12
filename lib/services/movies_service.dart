import 'package:flutter_tv/domain/movie.dart';

abstract class MoviesService {
  Stream<List<Movie>> getMovies();
  Future<void> addMovie(Movie movie);
}
