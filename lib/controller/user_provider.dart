import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

enum Role { Admin, Lecturer, Student }

class UserProvider extends ChangeNotifier {
  var isLoginObsecure = true;
  Role status = Role.Admin;
  var userImage = File('');
  final picker = ImagePicker();
  final String _role = 'Admin';
  final String _category = 'Select Category';

  SharedPreferences? _prefs;
  String get role => _role;
  String get category => _category;
  get pass => isLoginObsecure;
  List<String> get roleList => _roleList;
  List<String> get categoryList => _categoryList;

  set role(String value) {
    role = value;
    notifyListeners();
  }

  set category(String value) {
    category = value;
    notifyListeners();
  }

  issecure() {
    isLoginObsecure = !isLoginObsecure;
    notifyListeners();
  }

  final List<String> _roleList = <String>[
    'Admin',
    'Lecturer',
    'Student',
  ];

  final List<String> _categoryList = <String>[
    'Select Category',
    'Lecturer',
    'Student',
  ];
}
