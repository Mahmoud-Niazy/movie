import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/functions/navigation.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/core/utils/app_constance.dart';
import 'package:movie/features/on_boarding/presentation/view/on_boarding_view.dart';

import '../../../layout/presentation/view/layout_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 4,
      ),
      () {
        navigateAndRemoveUntil(
          context: context,
          screen: FirebaseAuth.instance.currentUser != null ? const LayoutView() :  const OnBoardingView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: AppConstance.primaryBackgroundColor,
      body: Center(
        child: Image.asset(
          AppAssets.logo,
          width: screenSize.width * .5,
          height: screenSize.height * .3,
        ),
      ),
    );
  }
}
