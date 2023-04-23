import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/item.dart';
import 'package:need2give/provider/auth_provider.dart';
import 'package:need2give/screens/main_pages_navbar/button_navbar.dart';
import 'package:need2give/services/item_service.dart';
import 'package:need2give/widgets/button.dart';
import 'package:need2give/widgets/textfield.dart';
import 'package:provider/provider.dart';

class AddItem extends StatefulWidget {
  static const String routeName = "/addItem";
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final ItemService _itemService = ItemService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemDesriptionController =
      TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  final List<String> _options = ["food", "medication", "clothes", "other"];
  String? _selectedOption;

  void add(BuildContext ctx) {
    _itemService.add(
      ctx,
      ItemDTO(
        name: _itemNameController.text,
        description: _itemDesriptionController.text,
        category: _selectedOption ?? "other",
        quantity: int.parse(_quantityController.text),
        donationCenterID:
            Provider.of<AuthProvider>(context, listen: false).profile.id,
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.backgroundColor,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Add item"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Label(text: "Name: "),
                Input(
                  controller: _itemNameController,
                  hintText: "Name",
                ),
                const Label(text: "Description: "),
                Input(
                  controller: _itemDesriptionController,
                  hintText: "Description",
                  numberOfLines: 5,
                ),
                const Label(text: "Quantity: "),
                Input(
                  controller: _quantityController,
                  hintText: "Quantity",
                  keyboardType: TextInputType.number,
                ),
                const Label(text: "Category: "),
                DropdownButton<String>(
                  value: _selectedOption,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedOption = newValue;
                    });
                  },
                  items: _options.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  hint: const Text("Select an option"),
                ),
                const SizedBox(height: 16),
                Button(
                  text: "Add",
                  onPressed: () {
                    add(context);
                    Navigator.pushNamed(context, ButtonNavbar.routeName);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
