import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/data/models/movie_model.dart';

import '../../../data/repos/home_repo.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  List<MovieModel> allFilms = [];
  getFilms() async {
    emit(GetFilmsLoadingState());
    var data = await homeRepo.getFilms();
    data.fold(
      (failure) => emit(GetFilmsErrorState(failure.errorMessage)),
      (films) {
        allFilms = films;
        emit(GetFilmsSuccessfullyState(films));
      },
    );
  }

  List<MovieModel> allSeries = [];
  getSeries() async {
    emit(GetSeriesLoadingState());
    var data = await homeRepo.getSeries();
    data.fold(
          (failure) => emit(GetSeriesErrorState(failure.errorMessage)),
          (series) {
            allSeries = series;
            emit(GetSeriesSuccessfullyState(series));
          },
    );
  }
}
