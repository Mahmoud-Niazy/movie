import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/features/home/presentation/view/widgets/carousel_widget.dart';
import 'package:movie/features/home/presentation/view/widgets/list_of_films.dart';
import 'package:movie/features/home/presentation/view/widgets/list_of_series.dart';
import 'package:movie/features/settings/presentation/manager/theme_cubit/theme_cubit.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: AppConstance.primaryBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          child: Image.asset(
                            AppAssets.avatar,
                            width: screenSize.width*.08,
                          ),
                          backgroundColor: ThemeCubit.get(context).themeMode == ThemeMode.dark ? Colors.black : Colors.grey,
                        ),
                        SizedBox(
                          width: screenSize.width*.02,
                        ),
                        Column(
                          children: [
                             Text(
                              'Welcome To',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              'Cinmy',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                         Icon(
                          Icons.search,
                          color: ThemeCubit.get(context).themeMode == ThemeMode.dark ? Colors.white : Colors.grey,
                        ),
                        SizedBox(
                          width: screenSize.width * .05,
                        ),
                         Icon(
                          Icons.notifications_none,
                          color: ThemeCubit.get(context).themeMode == ThemeMode.dark ? Colors.white : Colors.grey,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenSize.height * .01,
              ),
              const CarouselWidget(),
              SizedBox(
                height: screenSize.height * .01,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top Films',
                      style: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const ListOfFilms(),
                    SizedBox(
                      height: screenSize.height * .03,
                    ),
                    Text(
                      'Top Series',
                      style: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const ListOfSeries(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
