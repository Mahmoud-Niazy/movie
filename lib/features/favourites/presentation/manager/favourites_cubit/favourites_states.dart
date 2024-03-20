
abstract class FavouritesStates{}

class FavouritesInitialState extends FavouritesStates{}

class GetAllFavouritesLoadingState extends FavouritesStates{}
class GetAllFavouritesSuccessfullyState extends FavouritesStates{}
class GetAllFavouritesErrorState extends FavouritesStates{}

class AddToFavouritesState extends FavouritesStates{}
class RemoveFromFavouritesState extends FavouritesStates{}