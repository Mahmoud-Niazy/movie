import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/functions/navigation.dart';
import 'package:movie/core/widgets/custom_circular_progress_indicator.dart';
import 'package:movie/features/auth/presentation/view/login_view.dart';
import 'package:movie/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:movie/features/settings/presentation/manager/settings_cubit/settings_states.dart';
import 'package:movie/features/settings/presentation/view/edit_password_view.dart';
import 'package:movie/features/settings/presentation/view/widget/setting_item.dart';

import '../../../../core/functions/launch_url.dart';
import '../../../../core/utils/app_assets.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenSize.height * .05,
            horizontal: screenSize.width * .07),
        child: Column(
          children: [
            BlocBuilder<SettingsCubit, SettingsStates>(
              buildWhen: (previous,current)=> (previous != current && (current is GetUserDataSuccessfullyState || current is GetUserDataLoadingState || current is GetUserDataErrorState) ),
              builder: (context, state) {
                if (state is GetUserDataLoadingState) {
                  return const CustomCircularProgressIndicator();
                }
                if (state is GetUserDataErrorState) {
                  return Center(
                    child: Text(
                      state.error,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  );
                }
                if (state is GetUserDataSuccessfullyState) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: screenSize.width * .15,
                        child: Image.asset(AppAssets.avatar),
                      ),
                      SizedBox(
                        width: screenSize.width * .05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.userData.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            state.userData.email,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
            SizedBox(
              height: screenSize.height * .07,
            ),
            SettingItem(
              icon: Icons.dark_mode_outlined,
              onPressed: () {},
              isForTheme: true,
              title: 'Light Mode',
            ),
            SizedBox(
              height: screenSize.height * .03,
            ),
            SettingItem(
              title: 'Language',
              icon: Icons.language,
              onPressed: () {},
            ),
            SizedBox(
              height: screenSize.height * .03,
            ),
            SettingItem(
              title: 'Edit Password',
              onPressed: () {
                navigate(
                  context: context,
                  screen: const EditPasswordView(),
                );
              },
              icon: Icons.edit,
            ),
            SizedBox(
              height: screenSize.height * .03,
            ),
            SettingItem(
              icon: Icons.info_outline,
              onPressed: () {},
              title: 'Info',
            ),
            SizedBox(
              height: screenSize.height * .03,
            ),
            SettingItem(
              title: 'Contact us',
              onPressed: () {
                launchMyUrl();
              },
              icon: Icons.email,
            ),
            SizedBox(
              height: screenSize.height * .03,
            ),
            SettingItem(
              title: 'Logout',
              icon: Icons.logout,
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                navigateAndRemoveUntil(
                  context: context,
                  screen: const LoginView(),
                );
              },
            ),
            SizedBox(
              height: screenSize.height * .03,
            ),
          ],
        ),
      ),
    );
  }
}
