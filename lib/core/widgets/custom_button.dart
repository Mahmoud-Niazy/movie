import 'package:flutter/material.dart';
import 'package:movie/features/settings/presentation/manager/theme_cubit/theme_cubit.dart';

import '../utils/app_constance.dart';


class CustomButton extends StatelessWidget {
  final String title;

  final void Function()? onPressed;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppConstance.primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}