import 'package:dartz/dartz.dart';
import 'package:movie/features/auth/data/models/user_model.dart';

import '../../../../core/failure/failure.dart';

abstract class SettingsRepo {
  Future<Either<Failure,UserModel>>getUserData({
    required String userId,
});


  Future<Either<Failure,void>> updateUserPassword({
    required String newPassword,
});
}