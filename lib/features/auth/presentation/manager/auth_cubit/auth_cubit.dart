import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/auth_repo.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  signIn({
    required String email,
    required String password,
  }) async {
    emit(UserSignInLoadingState());
    var data = await authRepo.signIN(email: email, password: password);
    data.fold(
      (failure) => emit(
        UserSignInErrorState(
          failure.errorMessage,
        ),
      ),
      (uId) => emit(
        UserSignInSuccessfullyState(uId),
      ),
    );
  }

  signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(UserSignUpLoadingState());
    var data = await authRepo.signUp(
      email: email,
      password: password,
      name: name,
    );
    data.fold(
      (failure) => emit(UserSignUpErrorState(failure.errorMessage,),),
      (success) => emit(UserSignUpSuccessfullyState(),),
    );
  }
}
