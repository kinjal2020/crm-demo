import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProfileProvider with ChangeNotifier {
  updatePersonalInfo(gender, status, address, phone, home, emergency, city,
      state, docId) async {
    await FirebaseFirestore.instance.collection('employee').doc(docId).update({
      'gender':gender,
      'maritalStatus':status,
      'address':address,
      'mobileNumber':phone,
      'homeNumber':home,
      'city':city,
      'state':state
    });
  }
}
