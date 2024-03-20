import 'package:dartz/dartz.dart';
import 'package:movie/features/auth/data/models/user_model.dart';

import '../../../../core/failure/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure,void>>signUp({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failure,void>>uploadDataToFirestore({
    required UserModel userModel,
});

  Future<Either<Failure,String>>signIN({
    required String email,
    required String password,
});


}