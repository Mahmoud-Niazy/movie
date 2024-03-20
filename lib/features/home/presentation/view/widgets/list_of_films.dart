import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/functions/navigation.dart';
import '../../manager/home_cubit/home_cubit.dart';
import '../../manager/home_cubit/home_states.dart';
import '../movie_details_view.dart';

class ListOfFilms extends StatelessWidget{
  const ListOfFilms({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen: (previous, current) =>
      previous != current &&
          (current is GetFilmsLoadingState ||
              current is GetFilmsSuccessfullyState ||
              current is GetFilmsErrorState),
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        if (state is GetFilmsLoadingState || state is GetSeriesLoadingState) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[800]!,
            highlightColor: Colors.grey[100]!,
            child: SizedBox(
              height: screenSize.height*.25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15
                    ),
                    child: Card(
                      elevation: 1.0,
                      child:  SizedBox(
                        height: screenSize.height*.2,
                        width: screenSize.width*.25,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
        if (state is GetFilmsErrorState) {
          return Center(
            child: Text(
              state.error,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        }
        return Padding(
          padding:
          EdgeInsets.only(top: screenSize.height * .02),
          child: SizedBox(
            height: screenSize.height * .25,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    navigate(context: context, screen: MovieDetailsView(
                      path: cubit.allFilms[index].id,
                      movie: cubit.allFilms[index],
                      isFilm: 1,
                    ));
                  },
                  child: Image.network(
                    cubit.allFilms[index].image,
                    fit: BoxFit.cover,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemCount: cubit.allFilms.length,
            ),
          ),
        );

      },
    );
  }
}