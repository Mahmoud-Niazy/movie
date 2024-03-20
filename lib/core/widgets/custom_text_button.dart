import 'package:flutter/material.dart';

import '../utils/app_constance.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed ;


  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: AppConstance.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}