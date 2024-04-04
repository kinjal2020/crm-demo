import 'package:carparking/LeaveRequest/model/leave_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class LeaveProvider with ChangeNotifier {
  applyLeave(
    String empId,
    String position,
    String requestDate,
    String leaveType,
    String reason,
    String fromDate,
    String toDate,
    String totalDays,
    String name,
  ) async {
    await FirebaseFirestore.instance.collection('leave').doc().set({
      'employeeName':name,
      'employeeId': empId,
      'employeePosition': position,
      'requestDate': requestDate,
      'leaveType': leaveType,
      'reason': reason,
      'fromDate': fromDate,
      'toDate': toDate,
      'totalDays': totalDays,
      'status': 'Pending'
    });
  }

  Future<List<LeaveModel>> getEmployeeLeave(String empId) async {
    print(empId);
    var data = await FirebaseFirestore.instance
        .collection('leave')
        .where('employeeId', isEqualTo: empId)
        .get();
    print(data.docs.length);
    return data.docs.map((e) => LeaveModel.fromFirebase(e)).toList();
  }

  Future<List<LeaveModel>> getLeave() async {

    var data = await FirebaseFirestore.instance
        .collection('leave')
        .get();
    print(data.docs.length);
    return data.docs.map((e) => LeaveModel.fromFirebase(e)).toList();
  }

  approveLeave(String docId) async {
    await FirebaseFirestore.instance.collection('leave').doc(docId).update({
      'status': 'Approved',
    });
  }

  rejectLeave(String docId) async {
    await FirebaseFirestore.instance.collection('leave').doc(docId).update({
      'status': 'Rejected',
    });
  }

}
