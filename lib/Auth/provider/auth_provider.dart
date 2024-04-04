import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider with ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;
  QuerySnapshot<Map<String, dynamic>>? doc;
  createUser(String email, String password, String phone) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var user1 = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    user = user1.user;

    await FirebaseFirestore.instance.collection('Users').doc().set({
      'uid': user1.user!.uid,
      'email': user1.user!.email,
      'password': password,
      'phone': phone,
      'image': '',
      'role': pref.getString('role')
    });
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
