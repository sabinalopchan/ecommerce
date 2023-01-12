import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  CollectionReference<UserModel> userRef =
      FirebaseService.db.collection("users").withConverter<UserModel>(
            fromFirestore: (snapshot, _) {
              return UserModel.fromFirebaseSnapshot(snapshot);
            },
            toFirestore: (model, _) => model.toJson(),
          );

  Future<UserCredential> register(
      UserModel user, String email, String password) async {
    var auth = await FirebaseService.firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password); //create user with email and password
        user.userId=auth.user!.uid;//
        userRef.add(user);

    return auth;
  }
}
