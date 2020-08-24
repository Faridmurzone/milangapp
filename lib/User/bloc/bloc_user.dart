import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:milanesapp/Milanesa/model/milanesa.dart';
import 'package:milanesapp/User/model/user.dart';
import 'package:milanesapp/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:milanesapp/User/repository/cloud_firestore_api.dart';
import 'package:milanesapp/User/repository/cloud_firestore_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:milanesapp/User/repository/firebase_storage_repository.dart';
import 'package:milanesapp/User/ui/widgets/profile_milanesa.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  // Flujo de datos - Streams
  // Stream - Firebase
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  // casos de uso
  // 1. SignIn a la app con google
  Future<FirebaseUser> signIn() => _auth_repository.signInFirebase();
  // 2. Registrar usuario en db
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updateMilanesaData(Milanesa milanesa) => _cloudFirestoreRepository.updateMilanesaData(milanesa);
  Stream<QuerySnapshot> milanesasListStream = Firestore.instance.collection(CloudFirestoreApi().MILANESAS).snapshots();
  Stream<QuerySnapshot> get milanesasStream => milanesasListStream;
  List<ProfileMilanesa> buildMilanesas(List<DocumentSnapshot> milanesasListSnapshot) => _cloudFirestoreRepository.buildMilanesas(milanesasListSnapshot);

  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<StorageUploadTask> uploadFile(String path, File image) => _firebaseStorageRepository.uploadFile(path, image);


  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {}
}
