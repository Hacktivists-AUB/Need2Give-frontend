import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/widgets/item.dart';

class inventory extends StatefulWidget {
  const inventory({super.key});

  @override
  State<inventory> createState() => _inventory();
}

class _inventory extends State<inventory> {
  final List<Map<String, dynamic>> _items = [
    {
      "id": 1,
      "name": "Panadol",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor luctus urna, a efficitur neque placerat eu. Integer dictum tellus id tellus sollicitudin, eu varius nunc auctor.",
      "center": "Sweet tooth pharmacy",
      "quantity": 10,
      "category": "Medicine",
    },
    {
      "id": 2,
      "name": "Rice",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor luctus urna, a efficitur neque placerat eu. Integer dictum tellus id tellus sollicitudin, eu varius nunc auctor.",
      "center": "Ubi's charity",
      "quantity": 11,
      "category": "Food",
    },
    {
      "id": 3,
      "name": "Noodles",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor luctus urna, a efficitur neque placerat eu. Integer dictum tellus id tellus sollicitudin, eu varius nunc auctor.",
      "center": "Ubi's charity",
      "quantity": 2,
      "category": "Food",
    },
    {
      "id": 4,
      "name": "Shirt",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor luctus urna, a efficitur neque placerat eu. Integer dictum tellus id tellus sollicitudin, eu varius nunc auctor.",
      "center": "Ubi's charity",
      "quantity": 100,
      "category": "Clothing",
    },
    {
      "id": 5,
      "name": "Candy",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor luctus urna, a efficitur neque placerat eu. Integer dictum tellus id tellus sollicitudin, eu varius nunc auctor.",
      "center": "Ubi's charity",
      "quantity": 31,
      "category": "Food",
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
                children: _items.map((e) => ItemListTile(item: e)).toList(),
              ),
      ],
    );
  }
}