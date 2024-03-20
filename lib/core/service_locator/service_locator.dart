import 'package:get_it/get_it.dart';
import 'package:movie/features/home/data/repos/home_repo_imp.dart';
import 'package:movie/features/settings/data/repos/settings_repo.dart';
import 'package:movie/features/settings/data/repos/settings_repo_imp.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/data/repos/auth_repo_imp.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../api_services/api_services.dart';

final serviceLocator = GetIt.instance;

class ServicesLocator {
  static void init() {
    /// Api Services
    serviceLocator.registerLazySingleton<ApiServices>(
      () => ApiServices(),
    );

    /// Repos
    serviceLocator.registerLazySingleton<HomeRepo>(
      () => HomeRepoImp(
        serviceLocator(),
      ),
    );
    serviceLocator.registerLazySingleton<AuthRepo>(
      () => AuthRepoImp(),
    );
    serviceLocator.registerLazySingleton<SettingsRepo>(
          () => SettingsRepoImp(),
    );
  }
}
