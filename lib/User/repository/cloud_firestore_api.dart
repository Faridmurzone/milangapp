import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:milanesapp/Milanesa/model/milanesa.dart';
import 'package:milanesapp/User/model/user.dart';
import 'package:milanesapp/User/ui/widgets/profile_milanesa.dart';

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
      'userOwner': _db.document("${USERS}/${user.uid}"),
      'urlImage': milanesa.urlImage
      }).then((DocumentReference docRef) {
        docRef.get().then((DocumentSnapshot snapshot){
          DocumentReference refUsers = _db.collection(USERS).document(user.uid);
          refUsers.updateData({
            'myMilanesas': FieldValue.arrayUnion([_db.collection("${MILANESAS}/${snapshot.documentID}")])
          });
        });
       });
    });

  }

  List<ProfileMilanesa> buildMilanesas(List<DocumentSnapshot> milanesasListSnapshot) {
    List<ProfileMilanesa> profileMilanesas = List<ProfileMilanesa>();
    milanesasListSnapshot.forEach((milanga) {
      profileMilanesas.add(ProfileMilanesa(
          Milanesa(
              name: milanga.data['name'],
              description: milanga.data['description'],
              urlImage: milanga.data['urlImage'])
      ));
    });
    return profileMilanesas;
  }
}