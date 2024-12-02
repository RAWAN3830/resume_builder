import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:resume/core/constant/strings.dart';

class FirebaseGoogleAuth {
  static Future<OAuthCredential?> googleSignUp() async {
    try {

      final GoogleSignIn googleSignIn = GoogleSignIn();

     
      final GoogleSignInAccount? user = await googleSignIn.signIn();
      if (user == null) {
        throw Exception("Google Sign-In canceled by user");
      }


      final GoogleSignInAuthentication googleAuth = await user.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );


      final UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        print("User Name: ${firebaseUser.displayName}");
        print("User Email: ${firebaseUser.email}");
        print("User Photo URL: ${firebaseUser.photoURL}");
      }


      final Map<String, dynamic> userData = {
        'email': user.email,
        'uid': user.id,
        'name': user.displayName,
        'photoUrl': user.photoUrl,
      };

     await FirebaseFirestore.instance
          .collection(Strings.fireStoreGoogleUser)
          .doc(user.id)
          .set(userData, SetOptions(merge: true));

      return credential;
    } catch (e) {
      // Handle errors
      print("Error during Google Sign-In: $e");
      return null;
    }
  }
}
