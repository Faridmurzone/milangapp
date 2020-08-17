import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:milanesapp/User/model/user.dart';

class CloudFirestoreApi{
  final String USERS = "users";
  final String MILANESAS = "milanesas";

  final Firestore _db = Firestore.instance;
  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoUrl,
      'myMilanesas': user.myMilanesas,
      'MyFavoriteMilanesas': user.myFavoriteMilanesas,
      'lastSignIn': DateTime.now()
    }, merge: true);
  }
}