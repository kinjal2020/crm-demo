class TaskModel {
  final String? taskId;
  final String? taskName;
  final String? taskCode;
  final String? assignTo;
  final String? managerName;
  final String? currentStatus;
  final String? assignDate;
  final String? endDate;
  final String? timeTaken;

  TaskModel(
      {required this.taskId,
      required this.taskName,
      required this.taskCode,
      required this.assignTo,
      required this.managerName,
      required this.currentStatus,
      required this.assignDate,
      required this.endDate,
      required this.timeTaken});
}

List<TaskModel> taskList = [
  TaskModel(
      taskId: 'Task101',
      taskName: 'Developing',
      taskCode: 'TD2503',
      assignTo: 'A Team',
      managerName: 'Jegan',
      currentStatus: 'Incomplete',
      assignDate: '01-02-2023',
      endDate: '11-02-2023',
      timeTaken: '11'),
  TaskModel(
      taskId: 'Task102',
      taskName: 'Designing',
      taskCode: 'TD2504',
      assignTo: 'B Team',
      managerName: 'Jegan',
      currentStatus: 'Incomplete',
      assignDate: '01-02-2023',
      endDate: '11-02-2023',
      timeTaken: '11'),
  TaskModel(
      taskId: 'Task103',
      taskName: 'Developing',
      taskCode: 'TD2503',
      assignTo: 'A Team',
      managerName: 'Jegan',
      currentStatus: 'Incomplete',
      assignDate: '01-02-2023',
      endDate: '11-02-2023',
      timeTaken: '11'),
  TaskModel(
      taskId: 'Task104',
      taskName: 'Designing',
      taskCode: 'TD2503',
      assignTo: 'B Team',
      managerName: 'Jegan',
      currentStatus: 'Incomplete',
      assignDate: '01-02-2023',
      endDate: '11-02-2023',
      timeTaken: '11'),
];
