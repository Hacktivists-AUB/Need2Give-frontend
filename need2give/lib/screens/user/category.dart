import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/item.dart';
import 'package:need2give/screens/user/search.dart';
import 'package:need2give/services/item_service.dart';
import 'package:need2give/widgets/item.dart';
import 'package:need2give/widgets/textfield.dart';

class Category extends StatefulWidget {
  static const String routeName = "/category";
  final String category;
  const Category({super.key, required this.category});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
        widget.category == "All"
            ? {}
            : {"categories": widget.category.toLowerCase()});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SearchBar(
                searchMode: SearchMode.onlyItems,
                params: widget.category == "All"
                    ? {}
                    : {
                        "categories": widget.category.toLowerCase(),
                      },
              ),
              const SizedBox(height: 18),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Found ${_items.length} items",
                  style: const TextStyle(
                    color: Global.mediumGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Column(
                children: _items.map((e) => ItemListTile(item: e)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
