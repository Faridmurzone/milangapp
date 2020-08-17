import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:milanesapp/User/model/user.dart';
import 'package:milanesapp/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:milanesapp/User/repository/cloud_firestore_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  // Flujo de datos - Streams
  // Stream - Firebase
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;


  // casos de uso
  // 1. SignIn a la app con google
  Future<FirebaseUser> signIn() {
    return _auth_repository.signInFirebase();
  }
  // 2. Registrar usuario en db
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);

  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {}
}
