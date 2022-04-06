import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noticeboard_system/controller/controller.dart';
import 'package:noticeboard_system/core/styles.dart';
import 'package:noticeboard_system/data/source/firebase_source/auth.dart';
import 'package:provider/provider.dart';

class AddNoticeScreen extends StatefulWidget {
  const AddNoticeScreen({Key? key}) : super(key: key);

  @override
  State<AddNoticeScreen> createState() => _AddNoticeScreenState();
}

class _AddNoticeScreenState extends State<AddNoticeScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _dialogKey = GlobalKey<State>();
  List<String> _imagePath = [], _imageName = [];

  List<XFile>? _image;
  bool isPress = false;

  _loadImage() async {
    try {
      final _picker = ImagePicker();
      //     // Pick an image
      final List<XFile>? image = await _picker.pickMultiImage();
      if (image != null) {
        setState(() {
          _image = image;
        });
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      return "error while picking file.";
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 14, 182, 159),
        title: Text(
          'Add Notice',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: kWhiteColor,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.minBlockVertical! * 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Form(
                    child: Column(
                      children: [
                        InputBox(
                          controller: _titleController,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'field cannot be empty';
                            }
                            return null;
                          },
                          inputType: TextInputType.text,
                          hintText: 'Title',
                          textColor: kDarkColor,
                        ),
                        SizedBox(
                          height: SizeConfig.minBlockVertical! * 3,
                        ),
                        SelectBox(
                          value: userProvider.category,
                          textColor: kDarkColor,
                          iconColor: kDarkColor,
                          borderSide: const BorderSide(
                            color: kSecondaryBorder,
                          ),
                          validator: (value) {
                            if (value.trim().isEmpty ||
                                value.trim().toString() == "Select Category") {
                              return 'field cannot be empty';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            userProvider.category = value.toString();
                          },
                          items: userProvider.getUserRole['userRole'] == 'Admin'
                              ? userProvider.adminCategoryList.map((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: GoogleFonts.inter(),
                                    ),
                                  );
                                }).toList()
                              : userProvider.lecturerCategoryList.map((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: GoogleFonts.inter(),
                                    ),
                                  );
                                }).toList(),
                        ),
                        SizedBox(
                          height: SizeConfig.minBlockVertical! * 3,
                        ),
                        Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: _image == null
                                        ? Image.asset('assets/image/logo.png')
                                        : SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            child: Row(
                                              children: _image!.map((e) {
                                                print(e.path);
                                                setState(() {
                                                  _imagePath.add(e.path);
                                                });
                                                return Card(
                                                  child: SizedBox(
                                                    height: 100,
                                                    width: 100,
                                                    child: Image.file(
                                                      File(e.path),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10.0),
                                child: SolidButton(
                                  width: 85,
                                  child: isPress == false
                                      ? Text(
                                          'upload',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            color: kWhiteColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      : const CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 1.5,
                                        ),
                                  onPressed: () {
                                    setState(() {
                                      _loadImage();
                                    });
                                  },
                                  color: const Color.fromARGB(
                                    255,
                                    14,
                                    182,
                                    159,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.minBlockVertical! * 3,
                        ),
                        InputArea(
                          controller: _descriptionController,
                          
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return;
                            }

                            return null;
                          },
                          inputType: TextInputType.text,
                          hintText: "Description",
                          textColor: kDarkColor,
                        ),
                        SizedBox(
                          height: SizeConfig.minBlockVertical! * 5,
                        ),
                        SolidButton(
                          child: isPress == false
                              ? Text(
                                  'Send',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      color: kWhiteColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                )
                              : const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 1.5,
                                ),
                          onPressed: () {
                            setState(() {
                              isPress = true;
                            });

                            // print(_imagePath);
                            // AuthFirebase()
                            //     .uploadFile(filePath: _imagePath.toString());

                            // AuthFirebase().uploadImage(
                            //   imageName: 'e.name',
                            //   imagePath: 'e.path',
                            // );

                            // _image!.map(
                            //   (e) {
                            //     AuthFirebase()
                            //         .uploadImage(
                            //       imageName: e.name,
                            //       imagePath: e.path,
                            //     )
                            //         .then((value) {
                            //       print(value);
                            //       print('object');
                            //     });
                            //   },
                            // );
                            if (userProvider.getUserRole['userRole'] ==
                                'Admin') {
                              AuthFirebase().addNoteAdmin(
                                title: _titleController.text,
                                category: userProvider.category,
                                description: _descriptionController.text,
                                postedBy: userProvider.getUserRole['userRole'],
                              );
                            } else if (userProvider.getUserRole['userRole'] ==
                                'Lecturer') {
                              AuthFirebase().addNoteLecturer(
                                title: _titleController.text,
                                category: userProvider.category,
                                description: _descriptionController.text,
                                postedBy: userProvider.getUserRole['userRole'],
                              );
                            }

                            Timer(const Duration(seconds: 1), () {
                              setState(() {
                                isPress = false;
                              });
                              success(
                                text: 'Notice created successful',
                              );
                            });
                            Timer(const Duration(seconds: 2), () {
                              Navigator.pop(context);
                            });
                          },
                          color: const Color.fromARGB(255, 14, 182, 159),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  error({String? error = ''}) {
    displayErrorMessage(
      error: error!,
      context: _dialogKey,
      scaffoldKey: _scaffoldKey,
      popStack: false,
    );
    return;
  }

  success({String? text = ''}) {
    displaySuccessMessage(
      text: text!,
      context: _dialogKey,
      scaffoldKey: _scaffoldKey,
      popStack: false,
    );
    return;
  }
}
