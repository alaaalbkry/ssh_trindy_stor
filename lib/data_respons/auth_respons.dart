import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRespons {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signup(String password, String name, String email) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await result.user?.updateDisplayName(name);
      await result.user?.sendEmailVerification();

      return result.user;
    } catch (e) {
      print("Signup Error: $e");
      throw e;
    }
  }
}

class AuthRespons2 {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> LogIn(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // if (!result.user!.emailVerified) {
      //   await auth.signOut();
      //   throw FirebaseAuthException(
      //     code: "email-not-verified",
      //     message: "Please verify your email before login",
      //   );
      // }
      return result.user;
      // } on FirebaseAuthException catch (e) {
      //   print("Login Firebase Error: $e");
      //   throw e;
    } catch (e) {
      print("Login Error: $e");
      rethrow;
    }
  }
}

class GoogleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser =
          await _googleSignIn.authenticate();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        // accessToken: googleAuth. accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }
}

class Authresentpassowrd {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<void> resetpassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
