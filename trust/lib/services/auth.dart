import 'package:firebase_auth/firebase_auth.dart';
import 'package:trust/models/user.dart';

/* FirebaseUser has been changed to User

AuthResult has been changed to UserCredential

GoogleAuthProvider.getCredential() has been changed to GoogleAuthProvider.credential()

onAuthStateChanged which notifies about changes to the user's sign-in state was replaced with authStateChanges()

currentUser() which is a method to retrieve the currently logged in user, was replaced with the property currentUser and it no longer returns a Future<FirebaseUser> */

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Trustee? _user(User? user) {
    return user != null ? Trustee(uid: user.uid) : null;
  }

  Stream<Trustee?> get user {
    return _auth.authStateChanges().map((User? user) => _user(user));
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _user(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _user(user);
    } catch (e) {
      print(e);
      print('error');
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _user(user);
    } catch (e) {
      print('error');
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {}
  }
}
