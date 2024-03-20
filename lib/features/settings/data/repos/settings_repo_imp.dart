import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie/core/failure/failure.dart';
import 'package:movie/features/auth/data/models/user_model.dart';
import 'package:movie/features/settings/data/repos/settings_repo.dart';

class SettingsRepoImp extends SettingsRepo{
  @override
  Future<Either<Failure, UserModel>> getUserData({
    required String userId
}) async{
    try{
      var response = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      UserModel userData = UserModel.fromJson(response.data()!);
      return right(userData);
    }
    catch(error){
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserPassword({
    required String newPassword,
}) async{
    try{
      await FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
      return right(null);
    }
    catch(error){
      return left(Failure(error.toString()));
    }
  }
}
