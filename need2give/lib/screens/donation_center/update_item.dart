import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/item.dart';
import 'package:need2give/screens/main_pages_navbar/button_navbar.dart';
import 'package:need2give/services/item_service.dart';
import 'package:need2give/widgets/button.dart';
import 'package:need2give/widgets/textfield.dart';

class UpdateItem extends StatefulWidget {
  static const String routeName = "/updateItem";
  final Item item;
  const UpdateItem({Key? key, required this.item}) : super(key: key);

  @override
  State<UpdateItem> createState() => _UpdateItemState();
}

class _UpdateItemState extends State<UpdateItem> {
  final ItemService _itemService = ItemService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemDesriptionController =
      TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  final List<String> _options = ["food", "medication", "clothes", "other"];
  String? _selectedOption;

  void update(BuildContext ctx) {
    _itemService.edit(
      ctx,
      ItemDTO(
        name: _itemNameController.text,
        description: _itemDesriptionController.text,
        category: _selectedOption ?? widget.item.category,
        quantity: int.parse(_quantityController.text),
        donorID: widget.item.donorID,
        donationCenterID: widget.item.donationCenterID,
      ),
      widget.item.id,
    );

    setState(() {});
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _itemDesriptionController.dispose();
    _itemNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _itemNameController.text = widget.item.name;
    _itemDesriptionController.text = widget.item.description ?? "";
    _quantityController.text = "${widget.item.quantity}";

    return Scaffold(
      backgroundColor: Global.backgroundColor,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Update item"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Global.lightGrey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Item ID: ${widget.item.id}"),
                      ),
                      const SizedBox(height: 6),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          DateFormat("'Added on 'd MMM ',' yyyy 'at' hh:mm")
                              .format(
                            DateTime.parse(widget.item.createdAt),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                  text: "Update",
                  onPressed: () {
                    update(context);
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
