import 'package:flutter/material.dart';
import 'package:movie/core/functions/navigation.dart';
import 'package:movie/features/auth/presentation/view/login_view.dart';
import 'package:movie/features/on_boarding/data/models/on_boarding_item_data_model.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../on_boarding_view.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingItemDataModel onBoardingItemDataModel;
  final PageController pageController;

  const OnBoardingItem({
    super.key,
    required this.onBoardingItemDataModel,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          onBoardingItemDataModel.image,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(.6),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                onBoardingItemDataModel.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: screenSize.height * .01,
              ),
              SizedBox(
                width: screenSize.width * .6,
                child: Text(
                  onBoardingItemDataModel.subtitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(
                height: screenSize.height * .015,
              ),
              CustomButton(
                onPressed: () {
                  if (pageController.page!.toInt() !=
                      onBoardingData.length - 1) {
                    pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.linear,
                    );
                  } else {
                    navigateAndRemoveUntil(
                      context: context,
                      screen: const LoginView(),
                    );
                  }
                },
                title: 'Next',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
