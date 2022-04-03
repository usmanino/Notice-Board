 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noticeboard_system/controller/controller.dart';
import 'package:noticeboard_system/core/styles.dart';
import 'package:noticeboard_system/data/source/firebase_source/auth.dart';
import 'package:noticeboard_system/ui/auth/login/view/login.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _globalFormKey = GlobalKey<FormState>();
  final _firstname = TextEditingController();
  final _lastname = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  String? gender;
  String? userRole;

  int? val;
 
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: GradientTile(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.minBlockVertical,
              ),
              CustomAppBar(
                hasBack: true,
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeConfig.minBlockVertical! * 3,
                        ),
                        Text(
                          "REGISTER HERE",
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
                              Row(
                                children: [
                                  Expanded(
                                    child: InputBox(
                                      isUnderline: true,
                                      fillColor: Colors.transparent,
                                      hintText: "First Name",
                                      hitColor: kWhiteColor,
                                      controller: _firstname,
                                      validator: (value) {
                                        if (value!.trim().isEmpty) {
                                          return 'Field cannot be empty';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.minBlockHorizontal! * 3,
                                  ),
                                  Expanded(
                                    child: InputBox(
                                      isUnderline: true,
                                      fillColor: Colors.transparent,
                                      hintText: "Last Name",
                                      hitColor: kWhiteColor,
                                      controller: _lastname,
                                      validator: (value) {
                                        if (value!.trim().isEmpty) {
                                          return 'Field cannot be empty';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.minBlockVertical! * 3,
                              ),
                              InputBox(
                                isUnderline: true,
                                fillColor: Colors.transparent,
                                hintText: "E-mail",
                                hitColor: kWhiteColor,
                                enablePrefix: true,
                                preicon: Icons.mail,
                                controller: _email,
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
                              Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                  bottom: BorderSide(
                                    color: kWhiteColor,
                                    width: 2.0,
                                  ),
                                )),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.wc,
                                      color: kWhiteColor,
                                    ),
                                    SizedBox(
                                      width: SizeConfig.minBlockHorizontal! * 5,
                                    ),
                                    Radio(
                                      value: 1,
                                      groupValue: val,
                                      onChanged: (value) {
                                        setState(() {
                                          val = value as int?;
                                        });
                                      },
                                      activeColor: kPrimaryColor,
                                    ),
                                    Text(
                                      'Male',
                                      style: GoogleFonts.inter(
                                        fontSize: 13,
                                        color: kWhiteColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.minBlockHorizontal! * 3,
                                    ),
                                    Radio(
                                      value: 2,
                                      groupValue: val,
                                      onChanged: (value) {
                                        setState(() {
                                          val = value as int?;
                                        });
                                      },
                                      activeColor: kPrimaryColor,
                                    ),
                                    Text(
                                      'Female',
                                      style: GoogleFonts.inter(
                                        fontSize: 13,
                                        color: kWhiteColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.minBlockVertical! * 3,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: kWhiteColor,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Icon(
                                        Icons.people,
                                        color: kWhiteColor,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SelectBox(
                                      isUnderline: true,
                                      fillColor: Colors.transparent,
                                      value: userProvider.role,
                                      borderSide: const BorderSide(
                                        color: kSecondaryBorder,
                                      ),
                                      validator: (value) {
                                        if (value.trim().isEmpty ||
                                            value.trim().toString() ==
                                                "All Parks") {
                                          return 'Park cannot be empty';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        userProvider.role = value;
                                      },
                                      items: userProvider.roleList.map((item) {
                                        return DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: GoogleFonts.inter(),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.minBlockVertical! * 3,
                              ),
                              InputBox(
                                enablePrefix: true,
                                preicon: Icons.call,
                                isUnderline: true,
                                fillColor: Colors.transparent,
                                hintText: "Mobile No",
                                hitColor: kWhiteColor,
                                controller: _phone,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return 'Field cannot be empty';
                                  }
                                  return null;
                                },
                                inputType: TextInputType.phone,
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
                                controller: _password,
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
                          child: Text(
                            'Sign up',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: kWhiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          onPressed: () async {
                            val == 1 ? gender = "Male" : gender = "Female";

                            if (_globalFormKey.currentState!.validate()) {
                              await AuthFirebase().register(
                                firstname: _firstname.text,
                                lastname: _lastname.text,
                                email: _email.text,
                                password: _password.text,
                                phone: _phone.text,
                                gender: gender,
                                userRole: userProvider.role,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ),
                              );
                            }
                          },
                          color: kSuccessColor,
                        ),
                        SizedBox(
                          height: SizeConfig.minBlockVertical! * 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
