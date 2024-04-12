import 'package:carparking/Home/Secret%20Locker/model/secret_locker_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../Auth/provider/auth_provider.dart';

class SecretLockerProvider with ChangeNotifier {
  addDocument(name, dropDownValue, doc, authProvider) async {
    var d = await FirebaseStorage.instance
        .ref('secret locker')
        .child(authProvider.doc!.docs.first['employeeId'])
        .child(name)
        .putFile(doc!);
    String imageUrl = await d.ref.getDownloadURL();

    await FirebaseFirestore.instance
        .collection('Secret Locker')
        .doc(authProvider.doc!.docs[0].data()['employeeId'])
        .collection('document')
        .doc()
        .set({'categoryName': dropDownValue, 'document': imageUrl});
  }

  Future<List<SecretLockerModel>> getDocument(authProvider) async {
    try {
      print("AuthenticationProvider().doc!.docs[0].data()['employeeId']");
      print(authProvider.doc!.docs[0].data()['employeeId']);
      print("eklrf");
      var data = await FirebaseFirestore.instance
          .collection('Secret Locker')
          .doc(authProvider.doc!.docs[0].data()['employeeId'])
          .collection('document')
          .get();

      data.docs.map((e) => print(e.data()));
      return data.docs.map((e) => SecretLockerModel.fromJson(e)).toList();
      // return data.docs.map((e)   => SecretLockerModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception();
      return [];
      // TODO
    }
  }
}
