import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/provider/auth_provider.dart';
import 'package:need2give/services/auth_service.dart';
import 'package:need2give/widgets/button.dart';
import 'package:need2give/widgets/textfield.dart';
import 'package:provider/provider.dart';


class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void delete(BuildContext ctx) async {
    await _authService.delete(
      context: ctx,
      email: _emailController.text,
      password: _passwordController.text,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AuthProvider>(context).profile;
    _emailController.text = account.email;

    return Scaffold(
      backgroundColor: Global.backgroundColor,
      appBar: AppBar(
        title: const Text("Delete profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Label(text: "Email: "),
                Input(
                  controller: _emailController,
                  hintText: "Email",
                  required: true,
                ),
                const SizedBox(height: 12),
                const Label(text: "Password: "),
                Input(
                  controller: _passwordController,
                  hintText: "Password",
                  secret: true,
                ),
                const SizedBox(height: 18),
                Button(
                  text: "Delete",
                  onPressed: () {
                    _confirmDelete(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _confirmDelete(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete profile"),
          content: const Text(
              "Are you sure you want to delete your profile? This change is irreversable."),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text(
                "Delete",
                style: TextStyle(
                  color: Global.markerColor,
                ),
              ),
              onPressed: () async {
                delete(context);
              },
            ),
          ],
        );
      },
    );
  }
}
