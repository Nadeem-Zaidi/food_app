import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ModelService {
  Map<String, dynamic> toMap();
  ModelService fromMap(Map<String, dynamic> map);
  ModelService fromDocumentSnapShot(
      DocumentSnapshot<Map<String, dynamic>> snapshot);

  String collectionName();
  String? uid();
}
