class LeaveModel {
  final String? empId;
  final String? position;
  final String? requestDate;
  final String? leaveType;
  final String? reason;
  final int? totalDays;
  final String? fromDate;
  final String? toDate;
  final int? availableLeave;

  LeaveModel(
      {required this.empId,
      required this.position,
      required this.requestDate,
      required this.leaveType,
      required this.reason,
      required this.totalDays,
      required this.fromDate,
      required this.toDate,
      required this.availableLeave});
}
