import 'package:cloud_firestore/cloud_firestore.dart';

class SecretLockerModel {
  final String? categoryName;
  final String? document;
  final String? docId;

  SecretLockerModel(
      {required this.categoryName,
      required this.document,
      required this.docId});

  factory SecretLockerModel.fromJson(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    print(doc.data());
    return SecretLockerModel(
        categoryName: doc.data()!['categoryName'],
        document: doc.data()!['document'],
        docId: doc.id);
  }
}
