import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/widgets/button.dart';
import 'package:need2give/widgets/textfield.dart';

class EditProfile extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _mobileNoController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Global.backgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text("Edit Profile"),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Input(
                    controller: _usernameController,
                    hintText: "Username",
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Input(
                    controller: _emailController,
                    hintText: "Email",
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: PhoneInput(controller: _mobileNoController),
                ),
                Button(
                  text: 'Save',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapArrowleft3(BuildContext context) {
    Navigator.pop(context);
  }
}
