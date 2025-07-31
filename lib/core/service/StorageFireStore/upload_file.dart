import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart' as firebase_core;
import 'package:dashboard_e_commerce_food/core/handel_error.dart';
import 'package:dashboard_e_commerce_food/core/service/cloudStorageService/cloud_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_auth/firebase_auth.dart';
import '../../Data/Model/product_model.dart';

class FirebaseStorageService implements CloudService {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<void> addProductImage({required ProductModel productModel}) {
    // TODO: implement addProductImage
    throw UnimplementedError();
  }

  Future<void> ensureUserSignedIn() async {
    final auth = FirebaseAuth.instance;
    if (auth.currentUser == null) {
      await auth.signInAnonymously(); // Sign in anonymously
    }
  }

  @override
  Future<String> uploadFile({required File file, required String fileName}) async{
  try {
    await ensureUserSignedIn();
    final filePathName = p.basename(file.path); // includes extension
    final destination = '$fileName/$filePathName';

    final ref = storageRef.child(destination);

    final uploadTask = ref.putFile(file);

    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      final progress =
          100.0 * (snapshot.bytesTransferred / snapshot.totalBytes);
      if (kDebugMode) {
        print("Upload is $progress% complete.");
      }
    });

    final snapshot = await uploadTask;

    if (snapshot.state == TaskState.success) {
      final url = await ref.getDownloadURL();
      return url;
    } else {
      return "Upload failed with state: ${snapshot.state}";
    }
  } on firebase_core.FirebaseException catch (e) {
    return handleFirebaseUploadError(e.message);
  }catch (e) {
    return handleFirebaseUploadError(e.toString());
  }
  }
}