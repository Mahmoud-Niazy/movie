import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/presentation/manager/movie_details_cubit/movie_details_states.dart';

import '../../../data/repos/home_repo.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsStates> {
  final HomeRepo homeRepo;

  MovieDetailsCubit(this.homeRepo) : super(MovieDetailsInitialState());

  static MovieDetailsCubit get(context) =>
      BlocProvider.of<MovieDetailsCubit>(context);

  getMovieDetails({
    required String path,
}) async {
    emit(GetMovieDetailsLoadingState());
    var data = await homeRepo.getMovieDetails(path: path);
    data.fold(
      (failure) => emit(GetMovieDetailsErrorState(failure.errorMessage)),
      (movie) => emit(GetMovieDetailsSuccessfullyState(movie)),
    );
  }

}
