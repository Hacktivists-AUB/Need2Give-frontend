import 'package:flutter/material.dart';
import 'package:need2give/models/item.dart';
import 'package:need2give/services/item_service.dart';
import 'package:need2give/widgets/item.dart';

class Inventory extends StatefulWidget {
  final int id;
  const Inventory({
    super.key,
    required this.id,
  });

  @override
  State<Inventory> createState() => _Inventory();
}

class _Inventory extends State<Inventory> {
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
      {"donation_center_id": widget.id},
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: ListView(
        children: [
          Column(
            children: _items.map((e) => ItemListTile(item: e)).toList(),
          ),
        ],
      ),
    );
  }
}
