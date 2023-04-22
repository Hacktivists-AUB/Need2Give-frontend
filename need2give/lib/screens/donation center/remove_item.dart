import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/widgets/button.dart';
import 'package:need2give/widgets/textfield.dart';

class RemoveItem extends StatefulWidget {
  const RemoveItem({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RemoveItemState createState() => _RemoveItemState();
}

class _RemoveItemState extends State<RemoveItem> {
  final TextEditingController _itemNameController = TextEditingController();

  final TextEditingController _itemDesriptionController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Global.backgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text("Remove Item"),
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
                    controller: _itemNameController,
                    hintText: "name of item",
                  ),
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
