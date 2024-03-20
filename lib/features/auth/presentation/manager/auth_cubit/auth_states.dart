abstract class AuthStates{}

class AuthInitialState extends AuthStates{}

class UserSignInLoadingState extends AuthStates{}
class UserSignInSuccessfullyState extends AuthStates{
  final String uId ;
  UserSignInSuccessfullyState(this.uId);
}
class UserSignInErrorState extends AuthStates{
  final String error;
  UserSignInErrorState(this.error);
}

class UserSignUpLoadingState extends AuthStates{}
class UserSignUpSuccessfullyState extends AuthStates{}
class UserSignUpErrorState extends AuthStates{
  final String error;
  UserSignUpErrorState(this.error);
}