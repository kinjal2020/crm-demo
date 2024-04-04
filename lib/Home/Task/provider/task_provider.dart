import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../model/task_model.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> taskList = [];

  get getTaskList => taskList;

  assignTask(
      String taskCode,
      String taskName,
      String assignTo,
      String managerName,
      String currentStatus,
      String assignDate,
      String endDate,
      String timeTaken) async {
    await FirebaseFirestore.instance.collection('Tasks').doc().set({
      'taskCode': taskCode,
      'taskName': taskName,
      'assignTo': assignTo,
      'managerName': managerName,
      'currentStatus': currentStatus,
      'assignDate': assignDate,
      'endDate': endDate,
      'timeTaken': timeTaken
    });
  }

  updateTask(
      String taskId,
      String taskCode,
      String taskName,
      String assignTo,
      String managerName,
      String currentStatus,
      String assignDate,
      String endDate,
      String timeTaken) async {
    await FirebaseFirestore.instance.collection('Tasks').doc(taskId).update({
      'taskCode': taskCode,
      'taskName': taskName,
      'assignTo': assignTo,
      'managerName': managerName,
      'currentStatus': currentStatus,
      'assignDate': assignDate,
      'endDate': endDate,
      'timeTaken': timeTaken
    });
  }

  updateTaskStatus(
    String taskId,
  ) async {
    await FirebaseFirestore.instance.collection('Tasks').doc(taskId).update({
      'currentStatus': 'Completed',
    });
  }

  Future<List<TaskModel>> getTask() async {
    var data = await FirebaseFirestore.instance
        .collection('Tasks')
        .where('currentStatus', isEqualTo: 'Pending')
        .get();
    return data.docs.map((e) => TaskModel.fromDatabase(e)).toList();
  }

  Future<List<TaskModel>> getEmployeeTask(String team) async {
    var data = await FirebaseFirestore.instance
        .collection('Tasks')
        .where('currentStatus', isEqualTo: 'Pending')
        .where('team', isEqualTo: team)
        .get();
    return data.docs.map((e) => TaskModel.fromDatabase(e)).toList();
  }

  deleteTask(String taskId) async {
    await FirebaseFirestore.instance.collection('Tasks').doc(taskId).delete();
  }
}
