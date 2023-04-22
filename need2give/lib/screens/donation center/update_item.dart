import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/widgets/button.dart';
import 'package:need2give/widgets/textfield.dart';

class UpdateItem extends StatefulWidget {
  const UpdateItem({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UpdateItemState createState() => _UpdateItemState();
}

class _UpdateItemState extends State<UpdateItem> {
  final TextEditingController _itemNameController = TextEditingController();

  final TextEditingController _itemDesriptionController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selectedOption;
  List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Global.backgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text("Update item"),
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Input(
                    controller: _itemDesriptionController,
                    hintText: "Description",
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: NumberInput(
                      text: "Quantity",
                    )),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: DropdownButton<String>(
                      value:
                          selectedOption,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedOption = newValue;
                        });
                      },
                      items:
                          options.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: const Text(
                          'Select an option'), 
                    )),
                Button(
                  text: 'Update',
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
