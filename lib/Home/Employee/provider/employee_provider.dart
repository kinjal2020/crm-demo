import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../model/employee_model.dart';

class EmployeeProvider with ChangeNotifier {
  addEmployee(firstName, lastName, empImage, password, emailId, position, dept,
      team) async {
    await FirebaseFirestore.instance.collection('employee').doc().set({
      'employeeFirstName': firstName,
      'employeeLastName': lastName,
      'employeeImage': empImage,
      'password': password,
      'emailId': emailId,
      'jobPosition': position,
      'department': dept,
      'team': team,
    });
  }

  Future<List<EmployeeModel>> getEmployees() async {
    var data = await FirebaseFirestore.instance.collection('employee').get();
    return data.docs.map((e) => EmployeeModel.fromFirebase(e)).toList();
    // return data.docs.map((e) => EmployeeModel.fromDatabase(e)).toList();
  }
}
