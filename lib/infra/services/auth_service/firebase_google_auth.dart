import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:resume/core/constant/strings.dart';

class FirebaseGoogleAuth {
  static Future<OAuthCredential> googleSignUp() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    final user = await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth = await user?.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);
    print(user?.displayName);
    print(user?.email);
    print(user?.photoUrl);

    final userData = {
      'email': user?.email,
      'uid': user?.id,
      'name': user?.displayName,
    };

    await FirebaseFirestore.instance
        .collection(Strings.fireStoreGoogleUser)
        .doc(user?.displayName)
        .set(userData);

    return credential;
  }
}
