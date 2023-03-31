// ignore_for_file: deprecated_member_use, prefer_const_constructors, duplicate_ignore, camel_case_types

import 'package:flutter/material.dart';
import 'package:need2give/widgets/textfield.dart';
import '../../../widgets/backButton.dart';
import '../../../widgets/button.dart';
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class forgetPassword extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  forgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: backButton(),
              title: Text("Forgot Password"),
              centerTitle: true,
            ),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(left: 16, top: 119, right: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.vpn_key,
                                size: 150,
                                color: Colors.green,
                              )
                            ],
                          ),
                          Container(
                              width: 378,
                              margin:
                                  EdgeInsets.only(left: 8, top: 36, right: 8),
                              child: Text(
                                "Submit your email address and we will send you link to reset your password",
                                maxLines: null,
                                textAlign: TextAlign.center,
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 27),
                              child: Text(
                                "Email",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              )),
                          Padding(
                            padding: EdgeInsets.only(top: 18),
                            child: Input(
                                controller: emailController,
                                hintText: "Enter Email"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Button(
                              text: "Request change",
                              onPressed: () {},
                            ),
                          )
                        ])))));
  }

  onTapArrowleft2(BuildContext context) {
    Navigator.pop(context);
  }
}
