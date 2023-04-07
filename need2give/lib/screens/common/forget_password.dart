import 'package:flutter/material.dart';
import 'package:need2give/widgets/textfield.dart';
import '../../../widgets/button.dart';

class ForgetPassword extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text("Forgot Password"),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.only(left: 16, top: 119, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.vpn_key,
                      size: 150,
                      color: Colors.green,
                    )
                  ],
                ),
                Container(
                    width: 378,
                    margin: const EdgeInsets.only(left: 8, top: 36, right: 8),
                    child: const Text(
                      "Submit your email address and we will send you link to reset your password",
                      maxLines: null,
                      textAlign: TextAlign.center,
                    )),
                const Padding(
                    padding: EdgeInsets.only(top: 27),
                    child: Text(
                      "Email",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Input(
                      controller: _emailController, hintText: "Enter Email"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Button(
                    text: "Request change",
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapArrowleft2(BuildContext context) {
    Navigator.pop(context);
  }
}
