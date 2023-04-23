import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/item.dart';
import 'package:need2give/provider/auth_provider.dart';
import 'package:need2give/screens/user/search.dart';
import 'package:need2give/services/item_service.dart';
import 'package:need2give/widgets/item.dart';
import 'package:need2give/widgets/textfield.dart';
import 'package:provider/provider.dart';

class ViewAllItems extends StatefulWidget {
  static const String routeName = "/viewAll";
  const ViewAllItems({super.key});

  @override
  State<ViewAllItems> createState() => _ViewAllItemsState();
}

class _ViewAllItemsState extends State<ViewAllItems> {
  final ItemService _itemService = ItemService();
  List<Item> _items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  _loadItems() async {
    _items = await _itemService.get(
      context,
      {
        "donation_center_id":
            Provider.of<AuthProvider>(context, listen: false).profile.id
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventory"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SearchBar(searchMode: SearchMode.onlyItems),
              const SizedBox(height: 18),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Found ${_items.length} items",
                  style: const TextStyle(
                      color: Global.mediumGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 18),
              ..._items
                  .map((e) => ItemListTile(item: e, editable: true))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
