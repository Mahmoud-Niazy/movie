import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/settings/presentation/manager/settings_cubit/settings_states.dart';
import '../../../data/repos/settings_repo.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  final SettingsRepo settingsRepo;

  SettingsCubit(this.settingsRepo) : super(SettingsInitialState());

  static SettingsCubit get(context) => BlocProvider.of<SettingsCubit>(context);

  getUserData({
    required String userId,
  }) async {
    emit(GetUserDataLoadingState());
    var data = await settingsRepo.getUserData(userId: userId);
    data.fold(
      (failure) => emit(GetUserDataErrorState(failure.errorMessage)),
      (userData) => emit(GetUserDataSuccessfullyState(userData)),
    );
  }

  updateUserPassword({
    required String newPassword,
  }) async {
    emit(UpdateUserPasswordLoadingState());
    var data = await settingsRepo.updateUserPassword(newPassword: newPassword);
    data.fold(
      (failure) => emit(UpdateUserPasswordErrorState(failure.errorMessage)),
      (success) => emit(UpdateUserPasswordSuccessfullyState()),
    );
  }
}
