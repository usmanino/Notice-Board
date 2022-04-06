import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

enum Role { admin, lecturer, student }

class UserProvider extends ChangeNotifier {
  var isLoginObsecure = true;
  Role status = Role.admin;
  var userImage = File('');
  final picker = ImagePicker();
  String _role = 'Admin';
  String _category = 'Select Category';

  String get role => _role;
  String get category => _category;
  get pass => isLoginObsecure;

  List<String> get roleList => _roleList;
  List<String> get adminCategoryList => _adminCategoryList;
  List<String> get lecturerCategoryList => _lecturerCategoryList;

  set role(String value) {
    _role = value;
    notifyListeners();
  }

  set category(String value) {
    _category = value;
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

  final List<String> _adminCategoryList = <String>[
    'Select Category',
    'Lecturer',
    'Student',
  ];

  final List<String> _lecturerCategoryList = <String>[
    'Select Category',
    'Student',
  ];

  // display user role that login
  Map? _userRole;

  get getUserRole => _userRole;
  set setUserRole(Map<String, dynamic> role) {
    _userRole = role;
  }
}
