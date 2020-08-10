import 'package:firebase_auth/firebase_auth.dart';
import 'package:milanesapp/User/repository/firebase_auth.dart';

class AuthRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<FirebaseAuth> signInFirebase() => _firebaseAuthAPI.signIn();

}
