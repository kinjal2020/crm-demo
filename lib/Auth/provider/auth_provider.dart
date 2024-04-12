import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider with ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;
  QuerySnapshot<Map<String, dynamic>>? doc;
  String role = '';

  createUser(String email, String password, String phone, String name) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var user1 = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    user = user1.user;

    await FirebaseFirestore.instance.collection('Users').doc().set({
      'employeeId': user1.user!.uid,
      'email': user1.user!.email,
      'password': password,
      'phone': phone,
      'role': pref.getString('role'),
      'employeeImage':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/542px-Unknown_person.jpg',
      'employeeFirstName': name
    });
  }

  // AuthenticationProvider(){
  //   getLoginUserInfo();
  // }

  getLoginUserInfo() async {
    role == 'hr'
        ? doc = await FirebaseFirestore.instance
            .collection('Users')
            .where('email', isEqualTo: user!.email!)
            .get()
        : doc = await FirebaseFirestore.instance
            .collection('employee')
            .where('emailId', isEqualTo: user!.email!)
            .get();
    notifyListeners();
  }

  loginUser(
    String email,
    String password,
  ) async {
    var user1 = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    user = user1.user;
  }
}
