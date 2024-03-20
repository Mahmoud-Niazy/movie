import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/functions/navigation.dart';
import 'package:movie/core/functions/show_snack_bar.dart';
import 'package:movie/core/widgets/custom_button.dart';
import 'package:movie/core/widgets/custom_circular_progress_indicator.dart';
import 'package:movie/core/widgets/custom_icon_button.dart';
import 'package:movie/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:movie/features/settings/presentation/manager/settings_cubit/settings_states.dart';
import 'package:movie/features/settings/presentation/view/widget/custom_text_from_field_with_underline.dart';

class EditPasswordView extends StatelessWidget {
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController passwordConfirmationController =
      TextEditingController();
  static var formKey = GlobalKey<FormState>();

  const EditPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
          onPressed: () {
            navigatePop(context: context);
          },
          icon: Icons.arrow_back_ios_new,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Edit Password',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: screenSize.height * .08,
                    ),
                    CustomTextFieldWithUnderLine(
                      label: 'Write new password',
                      isPassword: true,
                      isSuffixIconShown: true,
                      controller: passwordController,
                      validate: (value) {
                        if (passwordController.text !=
                                passwordConfirmationController.text ||
                            value!.isEmpty) {
                          return 'Passwords must be equal';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: screenSize.height * .05,
                    ),
                    CustomTextFieldWithUnderLine(
                      label: 'Confirm password',
                      isPassword: true,
                      isSuffixIconShown: true,
                      controller: passwordConfirmationController,
                      validate: (value) {
                        if (passwordController.text !=
                                passwordConfirmationController.text ||
                            value!.isEmpty) {
                          return 'Passwords must be equal';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: screenSize.height * .2,
                    ),
                    BlocConsumer<SettingsCubit, SettingsStates>(
                      listener: (context, state) {
                        if (state is UpdateUserPasswordSuccessfullyState) {
                          navigatePop(context: context);
                          showSnackBar(
                            context: context,
                            label: 'Updated Successfully',
                            color: Colors.black,
                          );
                          passwordController.text = '';
                          passwordConfirmationController.text = '';
                        }
                        if(state is UpdateUserPasswordErrorState){
                          showSnackBar(
                            context: context,
                            label: state.error,
                            color: Colors.black,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is UpdateUserPasswordLoadingState) {
                          return const CustomCircularProgressIndicator();
                        }
                        return CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              SettingsCubit.get(context).updateUserPassword(
                                newPassword: passwordController.text,
                              );
                            }
                          },
                          title: 'Confirm',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
