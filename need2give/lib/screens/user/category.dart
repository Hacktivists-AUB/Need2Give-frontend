import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/screens/user/search.dart';
import 'package:need2give/widgets/item.dart';
import 'package:need2give/widgets/textfield.dart';

class Category extends StatelessWidget {
  static const String routeName = "/category";
  Category({super.key});

  final List<Map<String, dynamic>> _items = [
    {
      "id": 1,
      "name": "Panadol",
      "description": "very gud item",
      "center": "Ubi's charity",
      "quantity": 10,
      "category": "Medicine",
    },
    {
      "id": 2,
      "name": "Rice",
      "description": "very gud item",
      "center": "Ubi's charity",
      "quantity": 11,
      "category": "Food",
    },
    {
      "id": 3,
      "name": "Noodles",
      "description": "very gud item",
      "center": "Ubi's charity",
      "quantity": 2,
      "category": "Food",
    },
    {
      "id": 4,
      "name": "Shirt",
      "description": "very gud item",
      "center": "Ubi's charity",
      "quantity": 100,
      "category": "Clothing",
    },
    {
      "id": 5,
      "name": "Candy",
      "description": "very gud item",
      "center": "Ubi's charity",
      "quantity": 31,
      "category": "Food",
    },
    {
      "id": 6,
      "name": "Oil",
      "description": "very gud item",
      "center": "Ubi's charity",
      "quantity": 15,
      "category": "Food",
    },
    {
      "id": 7,
      "name": "Dress",
      "description": "very gud item",
      "center": "Ubi's charity",
      "quantity": 1,
      "category": "Clothing",
    },
    {
      "id": 8,
      "name": "Advil",
      "description": "very gud item",
      "center": "Ubi's charity",
      "quantity": 10,
      "category": "Medicine",
    },
    {
      "id": 9,
      "name": "Cough syrup",
      "description": "very gud item",
      "center": "Ubi's charity",
      "quantity": 20,
      "category": "Medicine",
    },
    {
      "id": 10,
      "name": "Barbie doll",
      "description": "very gud item",
      "center": "Ubi's charity",
      "quantity": 2,
      "category": "Other",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(category["name"]),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SearchBar(searchMode: SearchMode.onlyItems),
              const SizedBox(height: 20),
              Column(
                children: _items
                    .map(
                      (e) => Stack(
                        children: [
                          ItemListTile(item: e),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Global.green,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Global.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("See more"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
