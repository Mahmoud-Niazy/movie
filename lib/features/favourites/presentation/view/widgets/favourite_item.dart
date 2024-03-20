import 'package:flutter/material.dart';
import 'package:movie/features/favourites/presentation/manager/favourites_cubit/favourites_cubit.dart';
import 'package:movie/features/home/data/models/movie_model.dart';
import '../../../../../core/functions/navigation.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../../home/presentation/view/movie_details_view.dart';

class FavouriteItem extends StatelessWidget {
  final MovieModel movie;

  const FavouriteItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        navigate(
          context: context,
          screen: MovieDetailsView(
            isFilm: movie.isFilm! ,
            path: movie.isFilm! == 1 ? movie.id : 'series/${movie.id}',
            movie: movie,
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            movie.image,
            width: screenSize.width * .35,
            height: 170,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: screenSize.width * .4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: screenSize.width * .07,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow.shade700,
                    ),
                    SizedBox(
                      width: screenSize.width * .02,
                    ),
                    Text(
                      '${movie.rating}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomIconButton(
            onPressed: () {
              FavouritesCubit.get(context).removeFromFavourites(movie: movie);
            },
            icon: Icons.favorite,
            size: 30,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
