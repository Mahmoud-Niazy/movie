import 'package:flutter/material.dart';

import '../../../../../core/utils/app_constance.dart';
import '../../manager/theme_cubit/theme_cubit.dart';


//ignore: must_be_immutable
class CustomTextFieldWithUnderLine extends StatefulWidget{
  final String label ;
  final TextEditingController controller ;
  final String? Function(String?)? validate;
  bool isPassword ;
  bool isSuffixIconShown ;

  CustomTextFieldWithUnderLine({super.key,
    required this.label,
    required this.controller,
    required this.validate,
    this.isPassword = false,
    this.isSuffixIconShown = false,
  });

  @override
  State<CustomTextFieldWithUnderLine> createState() => _CustomTextFieldWithUnderLineState();
}

class _CustomTextFieldWithUnderLineState extends State<CustomTextFieldWithUnderLine> {
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: widget.validate,
      controller: widget.controller,
      obscureText: widget.isPassword,
      cursorColor: AppConstance.primaryColor,
      style: ThemeCubit.get(context).themeMode == ThemeMode.dark ? const TextStyle(
        color: Colors.white,
      ) : null,
      decoration: InputDecoration(

        suffixIcon: widget.isSuffixIconShown ? GestureDetector(
          onTap: (){
            setState(() {
              widget.isPassword = !widget.isPassword;
            });
          },
          child: Icon(
              widget.isPassword? Icons.visibility_off_outlined : Icons.remove_red_eye_outlined
          ),
        ) : null,
        hintText: widget.label,
        hintStyle: Theme.of(context).textTheme.titleMedium,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppConstance.primaryColor,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppConstance.primaryColor,
          ),
        ),
      ),
    );
  }
}