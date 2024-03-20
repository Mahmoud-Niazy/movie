import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/features/on_boarding/presentation/view/widgets/on_boarding_item.dart';
import '../../data/models/on_boarding_item_data_model.dart';

List<OnBoardingItemDataModel> onBoardingData = [
  OnBoardingItemDataModel(
    image: AppAssets.onBoarding1,
    title: 'Welcome To \n Cinmy',
    subtitle: 'Watch the best movies and the best services in the world',
  ),
  OnBoardingItemDataModel(
    image: AppAssets.onBoarding2,
    title: 'The best Watch and Quality',
    subtitle: 'Search and watch movies that bring your mood back',
  ),
  OnBoardingItemDataModel(
    image: AppAssets.onBoarding3,
    title: 'Let\'s play your favourite movie',
    subtitle: 'Movies & tv information updates movies trailerRotten',
  ),
];

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    var pageController = PageController();

    return Scaffold(
      // backgroundColor: AppConstance.primaryBackgroundColor,
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemBuilder: (context, index) {
          return OnBoardingItem(
            onBoardingItemDataModel: onBoardingData[index],
            pageController: pageController,
          );
        },
        itemCount: onBoardingData.length,
      ),
    );
  }
}
