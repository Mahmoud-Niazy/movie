import 'package:dartz/dartz.dart';
import 'package:movie/features/home/data/models/movie_model.dart';

import '../../../../core/failure/failure.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<MovieModel>>>getFilms();
  Future<Either<Failure,List<MovieModel>>>getSeries();

  Future<Either<Failure,MovieModel>> getMovieDetails({
    required String path,
});


}