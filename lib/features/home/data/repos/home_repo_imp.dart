import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/api_services/api_services.dart';
import 'package:movie/core/failure/failure.dart';
import 'package:movie/features/home/data/models/movie_model.dart';
import 'package:movie/features/home/data/repos/home_repo.dart';

class HomeRepoImp extends HomeRepo {
  final ApiServices apiServices;

  HomeRepoImp(this.apiServices);

  @override
  Future<Either<Failure, List<MovieModel>>> getFilms() async {
    try {
      var response = await apiServices.getData(path: '');
      List<MovieModel> films = [];
      response.forEach((film) {
        films.add(MovieModel.fromJson(film));
      });
      return right(films);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioException(error));
      }
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getSeries() async {
    try {
      var response = await apiServices.getData(path: 'series/');
      List<MovieModel> series = [];
      response.forEach((ser) {
        series.add(MovieModel.fromJson(ser));
      });
      return right(series);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioException(error));
      }
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieModel>> getMovieDetails({
    required String path,
  }) async {
    try{
      var response = await apiServices.getData(
        path: path,
      );
      MovieModel movie = MovieModel.fromJson(response);
      return right(
        movie,
      );

    }
        catch(error){
          if (error is DioException) {
            return left(ServerFailure.fromDioException(error));
          }
          return left(Failure(error.toString()));
        }
  }

}
