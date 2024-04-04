import 'package:cloud_firestore/cloud_firestore.dart';

class HolidayModel {
  final String? holidayImage;
  final String? holidayName;
  final String? holidayDate;

  HolidayModel(
      {required this.holidayImage,
      required this.holidayName,
      required this.holidayDate});

  factory HolidayModel.fromFirebase(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return HolidayModel(
        holidayImage: doc.data()!['image'],
        holidayName: doc.data()!['name'],
        holidayDate: doc.data()!['date'] ?? '');
  }
}

List<HolidayModel> holiDayList = [
  HolidayModel(
      holidayImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNRkmhVqiwdXWUa2qTmsCj6nulrxDt2D0fQph-KoCe4t3eW5t0TF73_6SM8SUuW9uTvwo&usqp=CAU',
      holidayName: 'Marry Christmas',
      holidayDate: '25 Dec'),
  HolidayModel(
      holidayImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNRkmhVqiwdXWUa2qTmsCj6nulrxDt2D0fQph-KoCe4t3eW5t0TF73_6SM8SUuW9uTvwo&usqp=CAU',
      holidayName: 'Marry Christmas',
      holidayDate: '25 Dec'),
  HolidayModel(
      holidayImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNRkmhVqiwdXWUa2qTmsCj6nulrxDt2D0fQph-KoCe4t3eW5t0TF73_6SM8SUuW9uTvwo&usqp=CAU',
      holidayName: 'Marry Christmas',
      holidayDate: '25 Dec'),
  HolidayModel(
      holidayImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNRkmhVqiwdXWUa2qTmsCj6nulrxDt2D0fQph-KoCe4t3eW5t0TF73_6SM8SUuW9uTvwo&usqp=CAU',
      holidayName: 'Marry Christmas',
      holidayDate: '25 Dec'),
];
