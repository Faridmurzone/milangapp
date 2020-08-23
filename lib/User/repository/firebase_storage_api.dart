import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageApi {
  final StorageReference _storageReference = FirebaseStorage.instance.ref();

  Future<StorageUploadTask> uploadFile(String path, File image) async {
    return _storageReference.child(path).putFile(image);
  }
}