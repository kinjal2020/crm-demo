import 'package:carparking/Home/HomeScreen/model/holiday_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class HolyDayProvider with ChangeNotifier {
  Future<List<HolidayModel>> getHoliDayList() async {
    var data = await FirebaseFirestore.instance.collection('holidays').get();
    return data.docs.map((e) => HolidayModel.fromFirebase(e)).toList();
    // return data.docs.map((e) => EmployeeModel.fromDatabase(e)).toList();
  }
}
