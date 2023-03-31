// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:need2give/widgets/button.dart';
import 'package:need2give/widgets/textfield.dart';

import '../../../widgets/backButton.dart';
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class EditProfile extends StatelessWidget {
  TextEditingController myController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileNoController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(249, 251, 255, 1),
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: backButton(),
              title: Text("Edit Profile"),
              centerTitle: true,
            ),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.fromLTRB(15, 25, 15, 25),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Input(
                                controller: myController, hintText: "Username"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Input(
                                controller: emailController, hintText: "Email"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: PhoneInput(controller: mobileNoController),
                          ),
                          Button(text: 'Save', onPressed: () {})
                        ])))));
  }

  onTapArrowleft3(BuildContext context) {
    Navigator.pop(context);
  }
}
