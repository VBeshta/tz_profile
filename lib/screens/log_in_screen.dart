import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:tz_profile/button/button.dart';
import 'package:tz_profile/colors/colors.dart';
import 'package:tz_profile/screens/profile_screen.dart';
import 'package:tz_profile/validator/validation_functions.dart';
import 'package:tz_profile/validator/validators_patterns.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  var formKey = GlobalKey<FormState>();

  late TextEditingController _inputEmailController;
  late TextEditingController _inputPasswordController;

  void initState() {
    super.initState();
    _inputEmailController = TextEditingController();
    _inputPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        gradient[0],
        gradient[1],
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 156,
                    ),
                    Image.asset('lib/assets/clutch_logo.png'),
                    SizedBox(
                      height: 70, //
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: Container(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Lorem ipsum dolor sit amet, ',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w100),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'consectetur adipiscing',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              TextSpan(
                                text: ' elit, sed do eiusmod tempor incididunt',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 106),
                    label('Email', _inputEmailController, emailPattern),
                    SizedBox(height: 16),
                    label(
                        'Password', _inputPasswordController, passwordPattern),
                    SizedBox(height: 26),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: RedButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            print(
                                "column validate ${formKey.currentState!.validate()}");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ),
                            );
                          }
                        },
                        text: 'Войти',
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Оферта на использование личных данных',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(255, 255, 255, 0.54),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget label(
      String hideText, TextEditingController controller, String pattern) {
    bool hasInputError = true;
    String? inputValidation;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0),
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          validator: (v) {
            if (isInputValid(v.toString(), pattern)) {
              print("isInputValid :${isInputValid(v.toString(), pattern)}");
              return validateInput(v.toString(), pattern, hideText);
            }
            return null;
          },
          inputFormatters: [
            FilteringTextInputFormatter.singleLineFormatter,
          ],
          decoration: InputDecoration(
            errorText: hasInputError ? inputValidation : null,
            prefix: Container(
              width: 37,
            ),
            hintText: hideText,
            border: InputBorder.none,
          ),
          onChanged: (value) {
            hasInputError = isInputValid(value.toString(), pattern);
            inputValidation =
                validateInput(value.toString(), pattern, hideText);
            print("hasInputError: $hasInputError");
            print("$hideText :$value");
            print("---------------------");
          },
        ),
      ),
    );
  }
}
