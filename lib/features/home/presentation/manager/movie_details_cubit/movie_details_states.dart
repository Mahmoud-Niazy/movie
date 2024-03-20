import 'package:movie/features/home/data/models/movie_model.dart';

abstract class MovieDetailsStates{}

class MovieDetailsInitialState extends MovieDetailsStates{}

class GetMovieDetailsLoadingState extends MovieDetailsStates{}
class GetMovieDetailsSuccessfullyState extends MovieDetailsStates{
  final MovieModel movie;
  GetMovieDetailsSuccessfullyState(this.movie);
}
class GetMovieDetailsErrorState extends MovieDetailsStates{
  final String error;
  GetMovieDetailsErrorState(this.error);
}

