import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/service_locator/service_locator.dart';
import 'package:movie/features/favourites/presentation/manager/favourites_cubit/favourites_cubit.dart';
import 'package:movie/features/favourites/presentation/manager/favourites_cubit/favourites_states.dart';
import 'package:movie/features/home/data/models/movie_model.dart';
import 'package:movie/features/home/data/repos/home_repo.dart';
import 'package:movie/features/home/presentation/manager/movie_details_cubit/movie_details_cubit.dart';
import 'package:movie/features/home/presentation/manager/movie_details_cubit/movie_details_states.dart';
import 'package:movie/features/home/presentation/view/widgets/circle_widget.dart';
import 'package:movie/features/home/presentation/view/widgets/shimmer_movie_details.dart';
import 'package:movie/features/home/presentation/view/widgets/video_player.dart';
import 'package:movie/features/home/presentation/view/widgets/writer_item_widget.dart';
import 'package:movie/features/settings/presentation/manager/theme_cubit/theme_cubit.dart';

class MovieDetailsView extends StatelessWidget {
  final String path;
  final MovieModel movie;

  final int isFilm;

  const MovieDetailsView({
    super.key,
    required this.path,
    required this.movie,
    required this.isFilm,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => MovieDetailsCubit(serviceLocator<HomeRepo>())
        ..getMovieDetails(path: path),
      child: Scaffold(
        // backgroundColor: AppConstance.primaryBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<MovieDetailsCubit, MovieDetailsStates>(
              builder: (context, state) {
                if (state is GetMovieDetailsLoadingState) {
                  return const ShimmerMovieDetails();
                }
                if (state is GetMovieDetailsErrorState) {
                  return Center(
                    child: Text(
                      state.error,
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                  );
                }
                if (state is GetMovieDetailsSuccessfullyState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenSize.height * .4,
                        child: VideoPlayer(
                          movieId: state.movie.trailerYoutubeId,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * .02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    state.movie.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
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
                                      '${state.movie.rating}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenSize.height * .04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                      color:
                                          ThemeCubit.get(context).themeMode ==
                                                  ThemeMode.dark
                                              ? Color(0XFF1F1F1F)
                                              : Colors.grey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    '4K',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
                                      color:Colors.white,

                                        ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const CircleWidget(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        state.movie.genre[0],
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                    ),
                                    const CircleWidget(),
                                  ],
                                ),
                                Text(
                                  '${state.movie.year}',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenSize.height * .04,
                            ),
                            Text(
                              'Story Line',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            SizedBox(
                              height: screenSize.height * .01,
                            ),
                            Text(
                              state.movie.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: Colors.grey,
                                  ),
                            ),
                            SizedBox(
                              height: screenSize.height * .03,
                            ),
                            Text(
                              'Writers',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            SizedBox(
                              height: screenSize.height * .02,
                            ),
                            SizedBox(
                              height: screenSize.height * .2,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return WriterItemWidget(
                                    writerName: state.movie.writers[index],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    width: 20,
                                  );
                                },
                                itemCount: state.movie.writers.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ),
        floatingActionButton: BlocBuilder<FavouritesCubit, FavouritesStates>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                if (FavouritesCubit.get(context).ids.contains(movie.id)) {
                  FavouritesCubit.get(context)
                      .removeFromFavourites(movie: movie);
                } else {
                  FavouritesCubit.get(context).addToFavourites(
                    movie: movie,
                    isFilm: isFilm,
                  );
                }
              },
              backgroundColor: ThemeCubit.get(context).themeMode == ThemeMode.dark ? Colors.black : Colors.white,
              child: Icon(
                Icons.favorite,
                color:  FavouritesCubit.get(context).ids.contains(movie.id)
                    ? Colors.red
                    : ThemeCubit.get(context).themeMode == ThemeMode.dark ?  Colors.white : Colors.grey,
                size: 30,
              ),
            );
          },
        ),
      ),
    );
  }
}
