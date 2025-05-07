import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie/core/api_services/api_services.dart';
import 'package:movie/core/cache_helper/cache_helper.dart';
import 'package:movie/core/service_locator/service_locator.dart';
import 'package:movie/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:movie/features/favourites/presentation/manager/favourites_cubit/favourites_cubit.dart';
import 'package:movie/features/home/data/repos/home_repo.dart';
import 'package:movie/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:movie/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
import 'package:movie/features/settings/data/repos/settings_repo.dart';
import 'package:movie/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:movie/features/settings/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:movie/features/settings/presentation/manager/theme_cubit/theme_states.dart';
import 'package:movie/features/splash/presentation/view/splash_view.dart';
import 'package:movie/firebase_options.dart';
import 'core/sql/sqflite.dart';
import 'core/utils/app_theme/app_theme.dart';
import 'features/auth/data/repos/auth_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
  ServicesLocator.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper.init();
  ApiServices.init();

  await SqfliteDb().init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthCubit(serviceLocator<AuthRepo>())),
        BlocProvider(
            create: (context) => FavouritesCubit()..getAllFavourites(),
            lazy: false),
        BlocProvider(
            create: (context) => HomeCubit(serviceLocator<HomeRepo>())
              ..getFilms()
              ..getSeries()),
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(
            create: (context) => SettingsCubit(serviceLocator<SettingsRepo>())
              ..getUserData(userId: FirebaseAuth.instance.currentUser!.uid))
      ],
      child: BlocProvider(
        create: (context) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeStates>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: ThemeCubit.get(context).themeMode,
              darkTheme: AppTheme.darkTheme,
              theme: AppTheme.lightTheme,
              home: const SplashView(),
            );
          },
        ),
      ),
    );
  }
}
