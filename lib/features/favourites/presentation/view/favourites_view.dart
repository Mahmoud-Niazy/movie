import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/widgets/custom_circular_progress_indicator.dart';
import 'package:movie/features/favourites/presentation/manager/favourites_cubit/favourites_cubit.dart';
import 'package:movie/features/favourites/presentation/manager/favourites_cubit/favourites_states.dart';
import 'package:movie/features/favourites/presentation/view/widgets/favourite_item.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 25,
              left: 20
            ),
            child: Text(
              'Favourites',
              style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * .05, vertical: 30),
              child: BlocBuilder<FavouritesCubit,FavouritesStates>(
                builder: (BuildContext context, state) {
                  if (state is GetAllFavouritesLoadingState) {
                    return const CustomCircularProgressIndicator();
                  }
                  return ListView.separated(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      return FavouriteItem(movie: FavouritesCubit.get(context).favouriteMovies[index]);
                    },
                    separatorBuilder: (context,index){
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: FavouritesCubit.get(context).favouriteMovies.length,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
