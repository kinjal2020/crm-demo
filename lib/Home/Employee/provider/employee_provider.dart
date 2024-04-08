import 'package:carparking/Auth/provider/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import '../model/employee_model.dart';

class EmployeeProvider with ChangeNotifier {
  addEmployee(firstName, lastName, empImage, password, emailId, position, dept,
      team, id) async {
    var d =
        await FirebaseStorage.instance.ref('users').child(id).putFile(empImage);
    String imageUrl = await d.ref.getDownloadURL();

    await FirebaseFirestore.instance.collection('employee').doc().set({
      'employeeFirstName': firstName,
      'employeeLastName': lastName,
      'employeeImage': imageUrl,
      'password': password,
      'emailId': emailId,
      'jobPosition': position,
      'department': dept,
      'team': team,
      'employeeId': id,
      'dOB': '',
      'country': '',
      'state': '',
      'city': '',
      'mobileNumber': '',
      'homeNumber': '',
      'gender': '',
      'maritalStatus': '',
      'address': '',
      'issueDate': '',
    });
  }

  shiftOfEmployee(){

  }

  editEmployee(password, emailId, position, dept, team, id, docId, dob, country,
      state, city, mobile, home, gender, status, address, issueDate) async {
    await FirebaseFirestore.instance.collection('employee').doc(docId).update({
      // 'employeeFirstName': firstName,
      // 'employeeLastName': lastName,
      // 'employeeImage': empImage,
      'password': password,
      'emailId': emailId,
      'jobPosition': position,
      'department': dept,
      'team': team,
      'employeeId': id,
      'dOB': dob,
      'country': country,
      'state': state,
      'city': city,
      'mobileNumber': mobile,
      'homeNumber': home,
      'gender': gender,
      'maritalStatus': status,
      'address': address,
      'issueDate': issueDate,
    });
  }

  Future<List<EmployeeModel>> getEmployees() async {
    var data = await FirebaseFirestore.instance.collection('employee').get();
    return data.docs.map((e) => EmployeeModel.fromFirebase(e)).toList();
  }


  deleteEmployee(String empId) async {
    await FirebaseFirestore.instance.collection('employee').doc(empId).delete();
  }
}
