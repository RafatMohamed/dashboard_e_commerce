abstract class FireBaseService {
  Future<void> addData({required String collectionName,required String path, required Map<String, dynamic> data});
  Future<void> deleteData({required String collectionName,String? path, required String id});
  Future<void> updateData({required String collectionName,String? path, required String id, required Map<String, dynamic> data});
  Future<Map<String,dynamic>?> getData({required String collectionName,required String path});
}