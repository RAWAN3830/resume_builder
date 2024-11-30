import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:resume/core/constant/strings.dart';

class FirebaseAuthService {
   // static final fireStore = FirebaseFirestore.instance;
  //-----------------------------------  FIREBASE AUTH FOR REGISTRATION --------------------------------------------------

  static Future<UserCredential> registerUser(
      {required String email,
      required String password,
      required String name}) async {
    final firebase = FirebaseAuth.instance;
    final userCredentials = await firebase.createUserWithEmailAndPassword(
        email: email, password: password);

    // final userData = {
    //   'email': userCredentials.user?.email,
    //   'password': password,
    //   'uid': userCredentials.user?.uid,
    //   'name': name
    // };
    //
    // await fireStore
    //     .collection(Strings.fireStoreUser)
    //     .doc(userCredentials.user?.uid)
    //     .set(userData);

    return userCredentials;
  }

//-----------------------------------  FIREBASE AUTH FOR LOG-IN --------------------------------------------------

  static Future<UserCredential> loginUser(
      {required String email, required String password}) async {
    final firebase = FirebaseAuth.instance;
    final userCredential = await firebase.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredential;
  }
}
