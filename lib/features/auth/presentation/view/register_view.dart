import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/functions/navigation.dart';
import 'package:movie/core/functions/show_snack_bar.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/core/widgets/custom_button.dart';
import 'package:movie/core/widgets/custom_circular_progress_indicator.dart';
import 'package:movie/core/widgets/custom_icon_button.dart';
import 'package:movie/core/widgets/custom_text_form_field.dart';
import 'package:movie/features/auth/presentation/view/login_view.dart';

import '../manager/auth_cubit/auth_cubit.dart';
import '../manager/auth_cubit/auth_states.dart';

class RegisterView extends StatelessWidget {
  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  static GlobalKey formKey = GlobalKey<FormState>();

  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: AppConstance.primaryBackgroundColor,
      appBar: AppBar(
        // backgroundColor: AppConstance.primaryBackgroundColor,
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
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Hero(
                        tag: 'logo',
                        child: Image.asset(
                          AppAssets.logo,
                          height: screenSize.height * .25,
                          width: screenSize.width * .4,
                        ),
                      ),
                    ),
                    Text(
                      'Create Account',
                      style: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: screenSize.height * .05,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'First name can\'t be empty';
                        }
                        return null;
                      },
                      controller: firstNameController,
                      label: 'First Name',
                    ),
                    SizedBox(
                      height: screenSize.height * .02,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Last name can\'t be empty';
                        }
                        return null;
                      },
                      controller: lastNameController,
                      label: 'Last Name',
                    ),
                    SizedBox(
                      height: screenSize.height * .02,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email can\'t be empty';
                        }
                        return null;
                      },
                      controller: emailController,
                      label: 'Email',
                    ),
                    SizedBox(
                      height: screenSize.height * .02,
                    ),
                    CustomTextFormField(
                      isPassword: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password can\'t be empty';
                        }
                        return null;
                      },
                      controller: passwordController,
                      label: 'Password',
                    ),
                    SizedBox(
                      height: screenSize.height * .08,
                    ),
                    BlocConsumer<AuthCubit, AuthStates>(
                      listener: (context, state) {
                        if (state is UserSignUpSuccessfullyState) {
                          showSnackBar(
                            context: context,
                            label: 'Success',
                            color: Colors.black,
                          );
                          navigateAndRemoveUntil(
                            context: context,
                            screen: const LoginView(),
                          );
                          emptyFormFields();
                        }
                        if(state is UserSignUpErrorState){
                          showSnackBar(
                            context: context,
                            label: state.error,
                            color: Colors.black,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is UserSignUpLoadingState) {
                          return const CustomCircularProgressIndicator();
                        }
                        return CustomButton(
                          onPressed: () async {
                            await AuthCubit.get(context).signUp(
                              name:
                                  '${firstNameController.text} ${lastNameController.text}',
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          },
                          title: 'SignUp',
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
  emptyFormFields(){
    lastNameController.text = '';
    firstNameController.text = '';
    passwordController.text = '';
    emailController.text = '';


  }
}
