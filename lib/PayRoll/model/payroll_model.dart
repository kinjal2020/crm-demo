class PayRollModel {
  final String? id;
  final String? jobStatus;
  final String? month;
  final String? status;
  final int? totalWorkDays;
  final int? workedDays;
  final int? additionalDays;
  final int? totalEarning;
  final int? basicPayroll;
  final int? dA;
  final int? otherPay;
  final int? totalDeduction;
  final int? pf;
  final int? esi;

  PayRollModel(
      {required this.id,
      required this.jobStatus,
      required this.totalWorkDays,
      required this.status,
      required this.workedDays,
      required this.additionalDays,
      required this.totalEarning,
      required this.basicPayroll,
      required this.dA,
      required this.otherPay,
      required this.totalDeduction,
      required this.month,
      required this.pf,
      required this.esi});
}
