import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model_service/model_service.dart';
import 'database_service.dart';

class Database implements DatabaseService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Database();
  @override
  Future<bool> addToDatabse<T extends ModelService>(T model,
      [String? collectionName]) async {
    DocumentReference docRef;
    try {
      if (collectionName != null) {
        docRef = await db.collection(collectionName).add(model.toMap());
      } else {
        docRef = await db.collection(model.collectionName()).add(model.toMap());
      }

      print("record added in the database with database id : ${docRef.id}");
      return true;
    } catch (error) {
      print("database addition failed due to error : $error");
      return false;
    }
  }

  Future<bool> addWithDocId<T extends ModelService>(T model,
      [String? id]) async {
    DocumentReference docRef;
    try {
      if (id != null) {
        docRef = db.collection(model.collectionName()).doc(id);
      } else {
        docRef = db.collection(model.collectionName()).doc(model.uid());
      }

      await docRef.set(model.toMap());
      return true;
    } catch (error) {
      print("database addition failed due to error : $error");
      return false;
    }
  }

  @override
  void fetchOne(String id) {
    // TODO: implement fetchOne
  }

  @override
  Future<ModelService?> fetchOneWithCurrentUserID<T extends ModelService>(
      T model) async {
    try {
      final currentUserUID = auth.currentUser?.uid;
      final DocumentReference<Map<String, dynamic>> documentReference =
          FirebaseFirestore.instance
              .collection(model.collectionName())
              .doc(currentUserUID);

      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await documentReference.get();

      var result = model.fromDocumentSnapShot(snapshot);

      return result;
    } catch (error) {
      print(error);
    }
  }
}
