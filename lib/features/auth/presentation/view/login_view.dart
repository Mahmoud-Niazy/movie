import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/functions/navigation.dart';
import 'package:movie/core/functions/show_snack_bar.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/core/widgets/custom_button.dart';
import 'package:movie/core/widgets/custom_circular_progress_indicator.dart';
import 'package:movie/core/widgets/custom_text_button.dart';
import 'package:movie/core/widgets/custom_text_form_field.dart';
import 'package:movie/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:movie/features/auth/presentation/view/register_view.dart';
import 'package:movie/features/layout/presentation/view/layout_view.dart';
import 'package:movie/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import '../manager/auth_cubit/auth_states.dart';

class LoginView extends StatelessWidget {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: AppConstance.primaryBackgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(
                      child: Hero(
                        tag: 'logo',
                        child: Image.asset(
                          AppAssets.logo,
                          height: screenSize.height * .3,
                          width: screenSize.width * .45,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Sign In to continue',
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * .03,
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
                    CustomTextButton(
                      title: 'Forget Password ? ',
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: screenSize.height * .1,
                    ),
                    BlocConsumer<AuthCubit, AuthStates>(
                      listener: (context, state) async {
                        if (state is UserSignInSuccessfullyState) {
                          SettingsCubit.get(context).getUserData(userId: state.uId);
                          navigateAndRemoveUntil(
                            context: context,
                            screen: const LayoutView(),
                          );
                          emptyFormFields();
                        }
                        if (state is UserSignUpErrorState) {
                          showSnackBar(
                            context: context,
                            label: state.error,
                            color: Colors.black,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is UserSignInLoadingState) {
                          return const CustomCircularProgressIndicator();
                        }
                        return CustomButton(
                          onPressed: ()  async{
                            if(formKey.currentState!.validate()){
                              await AuthCubit.get(context).signIn(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          title: 'SignIn',
                        );
                      },
                    ),
                    SizedBox(
                      height: screenSize.height * .01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(
                          'Don\'t have an account ?',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        CustomTextButton(
                          title: 'SignUP',
                          onPressed: () {
                            navigate(
                              context: context,
                              screen: const RegisterView(),
                            );
                          },
                        ),
                      ],
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
    emailController.text = '';
    passwordController.text = '';
  }
}
