import 'package:movie/features/auth/data/models/user_model.dart';

abstract class SettingsStates{}

class SettingsInitialState extends SettingsStates{}

class GetUserDataLoadingState extends SettingsStates{}
class GetUserDataSuccessfullyState extends SettingsStates{
  final UserModel userData;
  GetUserDataSuccessfullyState(this.userData);
}
class GetUserDataErrorState extends SettingsStates{
  final String error ;
  GetUserDataErrorState(this.error);
}

class UpdateUserPasswordLoadingState extends SettingsStates{}
class UpdateUserPasswordSuccessfullyState extends SettingsStates{}
class UpdateUserPasswordErrorState extends SettingsStates{
  final String error;
  UpdateUserPasswordErrorState(this.error);
}

