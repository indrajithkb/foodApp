import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodieapp/firebase/firebase_services.dart';
import 'package:foodieapp/login/view/widgets/reusable_widget.dart';
import 'package:foodieapp/utils/constants.dart';

import 'package:sizer/sizer.dart';

import '../../../login/login.dart';
import '../../signUp.dart';

class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({super.key});

  final TextEditingController _userNameTextController = TextEditingController();

  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  FocusNode fieldOne = FocusNode();

  FocusNode fieldTwo = FocusNode();

  FocusNode fieldThree = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKey,
            child: Container(
              //color: Colors.grey,

              height: height,
              //96.8.h,
              // width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 26.h,
                      // color: Colors.amber,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/topBg.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Image.asset(
                      'assets/images/signInTop.png',
                      width: height,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                      left: 0,
                      bottom: 0,
                      child: SizedBox(
                          height: 17.h,
                          child: Image.asset(
                            'assets/images/signInBottom.png',
                            fit: BoxFit.contain,
                          ))),
                  Positioned.fill(
                      top: 22.h,
                      bottom: 0,
                      child: Container(
                        height: 40.h,
                        //color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 2.h),
                              child: Text(
                                  FoodDeliveryConstantText.titleSignUpText,
                                  style: FoodDeliveryTextStyles.headingStyle),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 1.h, left: 2.h, right: 2.h),
                              child: SizedBox(
                                //height: 6.5.h,
                                child: reusableTextField(
                                  text: 'Username',
                                  icon: Icons.person_2_rounded,
                                  isPasswordType: false,
                                  isObscure: false,
                                  focusNode: fieldOne,
                                  onValidate: (value) {
                                    if (value!.isEmpty || value == null) {
                                      return "Username required";
                                    } else if (!RegExp(
                                            r"^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$")
                                        .hasMatch(value)) {
                                      return "Enter a valid username";
                                    }
                                    return null;
                                  },
                                  onFieldSub: (value) {
                                    FocusScope.of(context)
                                        .requestFocus(fieldTwo);
                                  },
                                  controller: _userNameTextController,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: .5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 1.h, left: 2.h, right: 2.h),
                              child: SizedBox(
                                  //height: 6.5.h,
                                  child: reusableTextField(
                                      text: "Email",
                                      icon: Icons.email,
                                      isPasswordType: true,
                                      isObscure: false,
                                      focusNode: fieldTwo,
                                      onFieldSub: (value) {
                                        FocusScope.of(context)
                                            .requestFocus(fieldThree);
                                      },
                                      onValidate: (value) {
                                        if (value!.isEmpty || value == null) {
                                          return "Email address required";
                                        } else if (!RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
                                            .hasMatch(value)) {
                                          return "Enter valid Email Id";
                                        }
                                        return null;
                                      },
                                      controller: _emailTextController)),
                            ),
                            SizedBox(
                              height: .5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 1.h, left: 2.h, right: 2.h),
                              child: SizedBox(
                                  // height: 6.5.h,
                                  child: BlocBuilder<SignUpBloc, SignUpState>(
                                builder: (context, state) {
                                  return reusableTextField(
                                      text: "Password",
                                      icon: Icons.lock_outline,
                                      isPasswordType: true,
                                      controller: _passwordTextController,
                                      isObscure: state.onActive,
                                      focusNode: fieldThree,
                                      onValidate: (value) {
                                        if (value!.isEmpty || value == null) {
                                          return "Password required";
                                        } else if (value.length < 8) {
                                          return "Enter valid password of atleast 8 letters";
                                        }
                                        // else if (!RegExp(
                                        //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                        //     .hasMatch(value)) {
                                        //   return "uppercase,lowercase,digit,and special character must be included";
                                        // }
                                        return null;
                                      },
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<SignUpBloc>()
                                              .add(ShowPasswd());
                                          
                                        },
                                        child: const Icon(
                                          Icons.remove_red_eye_outlined,
                                          color: Colors.grey,
                                        ),
                                      ));
                                },
                              )),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            signInSignUpButton(context, false, () {
                              if (validateForm()) {
                                FirebaseServ().createUser(
                                    context: context,
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text);
                              }
                            }),
                            SizedBox(
                              height: 2.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 1.5.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Already have an account?",
                                    style:
                                        FoodDeliveryTextStyles.textFieldStyle,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ScreenLogin(),
                                            ));
                                      },
                                      child: Text(
                                        "Sign In",
                                        style: TextStyle(
                                            color: const Color(0xFF1D9F80),
                                            fontSize: 11.sp,
                                            fontFamily: 'SpaceGrotesk',
                                            fontWeight: FontWeight.w600),
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8.3.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 2.h),
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Or Sign up with",
                                    style:
                                        FoodDeliveryTextStyles.textFieldStyle,
                                  )),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 2.h),
                                  child: Container(
                                    height: 6.h,
                                    width: 6.h,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF000000),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Image.asset(
                                        "assets/images/apple.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 2.h),
                                  child: Container(
                                    height: 6.h,
                                    width: 6.h,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF1877F2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(13.0),
                                      child: Image.asset(
                                        "assets/images/fbF.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 2.h),
                                  child: Container(
                                      height: 6.h,
                                      width: 6.h,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFD0463B),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: Image.asset(
                                          "assets/images/googleG.png",
                                          fit: BoxFit.contain,
                                        ),
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
//
          )),
    );
  }

  bool validateForm() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      return true;
    }
    return false;
  }
}
