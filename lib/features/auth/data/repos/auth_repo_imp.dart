import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie/core/failure/failure.dart';
import 'package:movie/features/auth/data/models/user_model.dart';
import 'package:movie/features/auth/data/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  @override
  signIN({
    required String email,
    required String password,
  }) async {
    try{
      var response = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(response.user!.uid);
    }
    catch(error){
      return left(Failure(error.toString()));
    }
  }

  @override
  signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try{
      UserCredential user =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel =
      UserModel(id: user.user!.uid, name: name, email: email);
      await uploadDataToFirestore(
        userModel: userModel,
      );
      return right(null);
    }
    catch(error){
      return left(Failure(error.toString()));
    }
  }

  @override
  uploadDataToFirestore({
    required UserModel userModel,
  }) async{
    try{
      await FirebaseFirestore.instance.collection('users').doc(userModel.id).set(userModel.toJson());
    return right(null);
    }
    catch(error){
      return left(Failure(error.toString()));
    }
  }
}
