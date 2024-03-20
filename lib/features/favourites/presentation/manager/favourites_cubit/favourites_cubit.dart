import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home/data/models/movie_model.dart';

import '../../../../../core/sql/sqflite.dart';
import 'favourites_states.dart';

class FavouritesCubit extends Cubit<FavouritesStates> {
  FavouritesCubit() : super(FavouritesInitialState());

  static FavouritesCubit get(context) =>
      BlocProvider.of<FavouritesCubit>(context);

  List<String> ids = [];
  List<MovieModel> favouriteMovies = [];

  getAllFavourites() async {
    ids = [];
    favouriteMovies = [];
    emit(GetAllFavouritesLoadingState());
    var data = await SqfliteDb().getData();
    for (var movie in data) {
      favouriteMovies.add(MovieModel.fromJson(movie));
      ids.add(movie['id']);
    }
    emit(GetAllFavouritesSuccessfullyState());
  }

  addToFavourites({
    required MovieModel movie,
    required int isFilm,
  }) async{
    ids.add(movie.id);
    emit(AddToFavouritesState());
    await SqfliteDb().insertData(
      id: movie.id,
      title: movie.title,
      image: movie.image,
      rating: movie.rating.toString(),
      isFilm: isFilm,
    );
    getAllFavourites();
  }

  removeFromFavourites({
    required MovieModel movie,
})async{
    ids.remove(movie.id);
    emit(RemoveFromFavouritesState());
    await SqfliteDb().deleteData(
      id: movie.id,
    );
    getAllFavourites();
  }
}
