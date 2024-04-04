import 'package:cloud_firestore/cloud_firestore.dart';

class LeaveModel {
  final String? empId;
  final String? leaveId;
  final String? empName;
  final String? position;
  final String? requestDate;
  final String? leaveType;
  final String? reason;
  final String? totalDays;
  final String? fromDate;
  final String? toDate;
  final String? status;

  LeaveModel({
    required this.empId,
    required this.leaveId,
    required this.empName,
    required this.position,
    required this.requestDate,
    required this.status,
    required this.leaveType,
    required this.reason,
    required this.totalDays,
    required this.fromDate,
    required this.toDate,
  });

  factory LeaveModel.fromFirebase(DocumentSnapshot<Map<String, dynamic>> map) {
    return LeaveModel(
        empId: map.data()!['employeeId'],
        empName: map.data()!['employeeName'],
        position: map.data()!['employeePosition'],
        requestDate: map.data()!['requestDate'],
        status: map.data()!['status'],
        leaveType: map.data()!['leaveType'],
        reason: map.data()!['reason'],
        totalDays: map.data()!['totalDays'],
        fromDate: map.data()!['fromDate'],
        toDate: map.data()!['toDate'],
        leaveId: map.id);
  }
}
