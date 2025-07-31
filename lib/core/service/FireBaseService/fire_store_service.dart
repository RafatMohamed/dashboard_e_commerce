import 'package:cloud_firestore/cloud_firestore.dart';

import 'Fire_base_service.dart';

class FireStoreService implements FireBaseService{

  final FirebaseFirestore fireStore=FirebaseFirestore.instance;

  @override
  Future<void> addData({required String collectionName, required String path, required Map<String, dynamic> data}) async {
    await fireStore.collection(collectionName).doc(path).set(data,SetOptions(merge: true));
  }

  @override
  Future<void> deleteData({required String collectionName, String? path, required String id}) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<Map<String,dynamic>?> getData({required String collectionName, required String path})async
  {
    final snapshot = await fireStore.collection(collectionName).doc(path).get();
    if (!snapshot.exists || snapshot.data() == null) {
      return null;
    }
    return snapshot.data();
  }

  @override
  Future<void> updateData({required String collectionName, String? path, required String id, required Map<String, dynamic> data}) {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}