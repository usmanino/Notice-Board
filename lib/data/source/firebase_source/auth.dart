import 'dart:io';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
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
    } on firebase_storage.FirebaseException catch (e) {
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
    } on firebase_storage.FirebaseException catch (e) {
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
    } on firebase_storage.FirebaseException catch (e) {
      return e;
    }
  }

  Future<void> uploadImage(
      {required String imageName, required String imagePath}) async {
    File file = File(
        " /data/user/0/com.example.noticeboard_system/cache/image_picker6173076920158267450.png");

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('images/imageName')
          .putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  Future<void> uploadFile({required String filePath}) async {
    File file = File(filePath);

    try {
      final storeImage =
          firebase_storage.FirebaseStorage.instance.ref().child('uploads/');
      await storeImage.putFile(file);
      String imageUrl = await storeImage.getDownloadURL();
      print('----------------------------');
      print(imageUrl);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }
}
