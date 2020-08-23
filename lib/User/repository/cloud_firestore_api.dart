import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:milanesapp/Milanesa/model/milanesa.dart';
import 'package:milanesapp/User/model/user.dart';

class CloudFirestoreApi{
  final String USERS = "users";
  final String MILANESAS = "milanesas";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return await ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoUrl,
      'myMilanesas': user.myMilanesas,
      'MyFavoriteMilanesas': user.myFavoriteMilanesas,
      'lastSignIn': DateTime.now()
    }, merge: true);
  }

  Future<void> updateMilanesaData(Milanesa milanesa) async {
    CollectionReference refMilanesas =  _db.collection(MILANESAS);
    await _auth.currentUser().then((FirebaseUser user) {
       refMilanesas.add({
      'name': milanesa.name,
      'description': milanesa.description,
      'likes': milanesa.likes,
      'userOwner': "${USERS}/${user.uid}",
      'urlImage': milanesa.urlImage
      });
    });

  }
}