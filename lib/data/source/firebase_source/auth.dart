import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class AuthFirebase {
  var formartDate = DateFormat('dd-MMM-yyyy').format(DateTime.now());
  var formartTime = DateFormat('hh:mm').format(DateTime.now());

  final _refRegister = FirebaseDatabase.instance.ref('register/');
  register({
    required String? firstname,
    required String? lastname,
    required String? email,
    required String? gender,
    required String? userRole,
    required String? phone,
    required String? password,
  }) async {
    try {
      String? userID = _refRegister.push().key;
      await _refRegister.child(userID!).set(
        {
          "firstname": firstname,
          "lastname": lastname,
          "email": email,
          "gender": gender,
          "userRole": userRole,
          "phone": phone,
          "password": password,
          "Date": formartDate,
        },
      ).then(
        (value) {
          return value;
        },
      );
    } on FirebaseException catch (e) {
      return e;
    }
  }

  final _addNoteAdmin = FirebaseDatabase.instance.ref('add_note_admin/');
  addNoteAdmin({
    required String? title,
    required String? category,
    required String? description,
    required String? postedBy,
  }) async {
    try {
      String? userID = _addNoteAdmin.push().key;
      await _addNoteAdmin.child(userID!).set(
        {
          "title": title,
          "category": category,
          "description": description,
          "Date": formartDate,
          "Time": formartTime,
          "postedBy": postedBy,
        },
      ).then(
        (value) {
          return value;
        },
      );
    } on FirebaseException catch (e) {
      return e;
    }
  }

  final _addNoteLecturer = FirebaseDatabase.instance.ref('add_note_lecturer/');
  addNoteLecturer({
    required String? title,
    required String? category,
    required String? description,
    required String? postedBy,
  }) async {
    try {
      String? userID = _addNoteLecturer.push().key;
      await _addNoteLecturer.child(userID!).set(
        {
          "title": title,
          "category": category,
          "description": description,
          "Date": formartDate,
          "Time": formartTime,
          "postedBy": postedBy,
        },
      ).then(
        (value) {
          return value;
        },
      );
    } on FirebaseException catch (e) {
      return e;
    }
  }
}
