import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:milanesapp/User/model/user.dart';
import 'package:milanesapp/Milanesa/model/milanesa.dart';
import 'package:milanesapp/User/repository/cloud_firestore_api.dart';
import 'package:milanesapp/User/ui/widgets/profile_milanesa.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreApi();
  
  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);
  Future<void> updateMilanesaData(Milanesa milanesa) => _cloudFirestoreAPI.updateMilanesaData(milanesa);

  List<ProfileMilanesa> buildMilanesas(List<DocumentSnapshot> milanesasListSnapshot) => _cloudFirestoreAPI.buildMilanesas(milanesasListSnapshot);
}