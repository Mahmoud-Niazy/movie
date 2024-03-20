import '../../../data/models/movie_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates{}

class GetFilmsLoadingState extends HomeStates{}
class GetFilmsSuccessfullyState extends HomeStates{
  final List<MovieModel> films;
  GetFilmsSuccessfullyState(this.films);
}
class GetFilmsErrorState extends HomeStates{
  final String error;
  GetFilmsErrorState(this.error);
}

class GetSeriesLoadingState extends HomeStates{}
class GetSeriesSuccessfullyState extends HomeStates{
  final List<MovieModel> series;
  GetSeriesSuccessfullyState(this.series);
}
class GetSeriesErrorState extends HomeStates{
  final String error ;
  GetSeriesErrorState(this.error);
}