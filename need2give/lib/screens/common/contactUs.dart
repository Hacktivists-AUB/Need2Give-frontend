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
class contactUs extends StatelessWidget {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileNoController = TextEditingController();

  TextEditingController messageController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: backButton(),
              title: Text("Contact us"),
              centerTitle: true,
            ),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(
                        left: 16, top: 27, right: 16, bottom: 27),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Input(controller: nameController, hintText: "Name"),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Input(
                              controller: emailController,
                              hintText: "Email",
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 18),
                              child:
                                  PhoneInput(controller: mobileNoController)),
                          Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Input(controller: messageController,
                              hintText: "Message",
                              numberOfLines: 6,)),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Button(text: "Send", onPressed: () {}),
                          )
                        ])))));
  }

  onTapArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
