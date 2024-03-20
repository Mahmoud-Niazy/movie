import 'package:flutter/material.dart';
import 'package:movie/core/widgets/custom_icon_button.dart';
import 'package:movie/features/settings/presentation/manager/theme_cubit/theme_cubit.dart';
import '../utils/app_constance.dart';

//ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  bool isPasswordShown;

  final String? Function(String?)? validator;
  bool isPassword;

  CustomTextFormField({
    super.key,
    required this.validator,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.isPasswordShown = true,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        border: Border.all(
            color: ThemeCubit.get(context).themeMode == ThemeMode.dark
                ? Colors.white.withOpacity(.4)
                : Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        obscureText: widget.isPassword ? widget.isPasswordShown : false,
        validator: widget.validator,
        controller: widget.controller,
        style: ThemeCubit.get(context).themeMode == ThemeMode.dark ? const TextStyle(
          color: Colors.white,
        ) : null,
        cursorColor: AppConstance.primaryColor,
        decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? CustomIconButton(
                    onPressed: () {
                      setState(() {
                        widget.isPasswordShown = !widget.isPasswordShown;
                      });
                    },
                    icon: widget.isPasswordShown
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined,
                  )
                : null,
            border: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: widget.label,
            hintStyle: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
