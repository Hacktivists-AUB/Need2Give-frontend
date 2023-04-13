import 'package:flutter/material.dart';
import 'package:need2give/widgets/button.dart';
import 'package:need2give/widgets/textfield.dart';

class ContactUs extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _mobileNoController = TextEditingController();

  final TextEditingController _messageController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text("Contact us"),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding:
                const EdgeInsets.only(left: 16, top: 27, right: 16, bottom: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Input(controller: _nameController, hintText: "Name"),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Input(
                    controller: _emailController,
                    hintText: "Email",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: PhoneInput(controller: _mobileNoController),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Input(
                    controller: _messageController,
                    hintText: "Message",
                    numberOfLines: 6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Button(text: "Send", onPressed: () {}),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
