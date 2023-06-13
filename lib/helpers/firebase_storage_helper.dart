import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class FirebaseStorageHelper {
  //static UploadTask? uploadTask;

  // static Future saveImageToFirebaseFireStorage2(
  //     {required File pickedImage, required String directoryName , required UploadTask uploadTask}) async {
  //   try {
  //     var ref = firebase_storage.FirebaseStorage.instance
  //         .ref()
  //         .child(directoryName)
  //         .child(Uri.file(pickedImage.path).pathSegments.last);
  //
  //     uploadTask = ref.putFile(pickedImage);
  //     final snapshot = await uploadTask.whenComplete(() {});
  //     final url = await snapshot.ref.getDownloadURL();
  //     return url;
  //
  //   } catch (error) {
  //     print(
  //         '--------------------------{error while uploading image to firebaseStorage}------------------------>$error');
  //   }
  // }

  static Future saveImageToFirebaseFireStorage(
      {required File pickedImage, required String directoryName}) async {
    try {
      var putFile = await firebase_storage.FirebaseStorage.instance
          .ref()
          .child(directoryName)
          .child(Uri.file(pickedImage.path).pathSegments.last)
          .putFile(File(pickedImage.path));
      String url = await putFile.ref.getDownloadURL();
      return url;
    } catch (error) {
      print(
          '--------------------------{error while uploading image to firebaseStorage}------------------------>$error');
    }
  }
}
