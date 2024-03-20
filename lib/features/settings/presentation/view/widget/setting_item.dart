import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/app_constance.dart';
import 'package:movie/features/settings/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:movie/features/settings/presentation/manager/theme_cubit/theme_states.dart';
import '../../../../../core/widgets/custom_icon_button.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final bool? isForTheme;

  final IconData icon;

  final void Function()? onPressed;

  const SettingItem({super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.isForTheme = false});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    return BlocBuilder<ThemeCubit, ThemeStates>(
  builder: (context, state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: ThemeCubit.get(context).themeMode == ThemeMode.dark?  Colors.white : Colors.black,
              size: 30,
            ),
            SizedBox(
              width: screenSize.width * .08,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        isForTheme == true
            ? BlocBuilder<ThemeCubit, ThemeStates>(
          builder: (context, state) {
            return Switch(
              activeColor: AppConstance.primaryColor,
              value: ThemeCubit.get(context).isLight,
              onChanged: (value) async {
                ThemeCubit.get(context).changeTheme();
              },
              trackOutlineColor: MaterialStateProperty.resolveWith(
                    (final Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return null;
                  }

                  return Colors.white;
                },

              ),
            );
          },
        )
            : CustomIconButton(
          onPressed: onPressed,
          icon: Icons.arrow_forward_ios,
        ),
      ],
    );
  },
);
  }
}
