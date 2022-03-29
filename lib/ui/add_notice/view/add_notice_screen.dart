import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noticeboard_system/controller/controller.dart';
import 'package:noticeboard_system/core/styles.dart';
import 'package:provider/provider.dart';

class AddNoticeScreen extends StatefulWidget {
  const AddNoticeScreen({Key? key}) : super(key: key);

  @override
  State<AddNoticeScreen> createState() => _AddNoticeScreenState();
}

class _AddNoticeScreenState extends State<AddNoticeScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _dialogKey = GlobalKey<State>();
  bool isPress = false;

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
                          userProvider.category = value;
                        },
                        items: userProvider.categoryList.map((item) {
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
                      InputBox(
                        readonly: true,
                        controller: _dateController,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'field cannot be empty';
                          }

                          return null;
                        },
                        enableSurfix: true,
                        suricon: Icons.date_range,
                        inputType: TextInputType.text,
                        hintText: 'Last Date',
                        textColor: kDarkColor,
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
