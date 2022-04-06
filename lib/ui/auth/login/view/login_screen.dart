import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noticeboard_system/controller/controller.dart';
import 'package:noticeboard_system/core/styles.dart';
import 'package:noticeboard_system/router/app_router.dart';
import 'package:noticeboard_system/ui/home/view/home.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _globalFormKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isPress = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      body: GradientTile(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.minBlockVertical! * 3,
                        ),
                        const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 100,
                          backgroundImage: AssetImage(Assets.banner),
                        ),
                        SizedBox(
                          height: SizeConfig.minBlockVertical! * 3,
                        ),
                        Text(
                          "BABCOCK UNIVERSITY",
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kWhiteColor,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.minBlockVertical! * 5,
                        ),
                        Form(
                          key: _globalFormKey,
                          child: Column(
                            children: [
                              InputBox(
                                isUnderline: true,
                                fillColor: Colors.transparent,
                                hintText: "E-mail",
                                hitColor: kWhiteColor,
                                enablePrefix: true,
                                preicon: Icons.mail,
                                controller: _emailController,
                                validator: (value) {
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp myReg = RegExp(pattern.toString());
                                  if (value!.trim().isEmpty) {
                                    return 'Email cannot be empty';
                                  }
                                  if (value.trim().length < 4) {
                                    return 'Invalid email supplied';
                                  }
                                  if (!myReg.hasMatch(value.trim())) {
                                    return 'Invalid email supplied';
                                  }
                                  return null;
                                },
                                inputType: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height: SizeConfig.minBlockVertical! * 3,
                              ),
                              InputBox(
                                isUnderline: true,
                                fillColor: Colors.transparent,
                                hintText: "Password",
                                hitColor: kWhiteColor,
                                enablePrefix: true,
                                preicon: Icons.lock,
                                controller: _passwordController,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return 'Password cannot be empty';
                                  }
                                  if (value.trim().length < 6) {
                                    return 'Password cannot be less than 6 characters';
                                  }
                                  return null;
                                },
                                suriconColor: kWhiteColor,
                                enableSurfix: true,
                                isPassword: userProvider.isLoginObsecure,
                                suricon: userProvider.isLoginObsecure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                onIconClick: () => userProvider.issecure(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.minBlockVertical! * 5,
                        ),
                        SolidButton(
                          child: isPress == false
                              ? Text(
                                  'Log in',
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
                            if (_globalFormKey.currentState!.validate()) {
                              setState(() {
                                isPress = true;
                              });
                              Timer(
                                const Duration(seconds: 1),
                                () async {
                                  setState(
                                    () {
                                      isPress = false;
                                    },
                                  );

                                  FirebaseDatabase.instance
                                      .ref('register/')
                                      .onValue
                                      .listen(
                                    (event) {
                                      final data = Map<String, dynamic>.from(
                                        event.snapshot.value as Map,
                                      );

                                      data.forEach(
                                        (key, value) {
                                          final nestOrder =
                                              Map<String, dynamic>.from(
                                                  value as Map);
                                          String _email = nestOrder["email"];
                                          String _password =
                                              nestOrder["password"];

                                          if (_emailController.text.trim() !=
                                                  _email ||
                                              _passwordController.text.trim() !=
                                                  _password) {
                                            displayErrorMessage(
                                                error: 'error login details',
                                                context: context,
                                                scaffoldKey: _scaffoldKey,
                                                  popStack: false);
                                          } else if (_emailController.text
                                                      .trim() ==
                                                  _email &&
                                              _passwordController.text.trim() ==
                                                  _password) {
                                            userProvider.setUserRole =
                                                nestOrder;

                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomeScreen(),
                                              ),
                                            );
                                          }
                                        },
                                      );
                                    },
                                  );
                                },
                              );
                            }
                          },
                          color: kSuccessColor,
                        ),
                        SizedBox(
                          height: SizeConfig.minBlockVertical! * 3,
                        ),
                        SolidButton(
                          child: Text(
                            'Sign in',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: kWhiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, NoticeBoardScreen.registration);
                          },
                          color: const Color(0xFF0D47A1),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
