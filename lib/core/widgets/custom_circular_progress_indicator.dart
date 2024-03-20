import 'package:flutter/material.dart';

import '../utils/app_constance.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppConstance.primaryColor,
      ),
    );
  }
}