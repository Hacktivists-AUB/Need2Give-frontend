import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/screens/user/search.dart';
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
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SearchBar(searchMode: SearchMode.onlyItems),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.6,
                      mainAxisSpacing: 8,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return _buildItemCard(_items[index]);
                      },
                      childCount: _items.length,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("See more"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCard(Map<String, dynamic> item) => Hero(
        tag: item["id"],
        child: GestureDetector(
          onTap: () {},
          child: GridTile(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Image.asset("assets/cart.png"),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item["name"],
                          style: const TextStyle(
                            color: Global.darkGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item["center"],
                          style: const TextStyle(
                            color: Global.mediumGrey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Quantity: ${item["quantity"]}",
                          style: const TextStyle(
                            color: Global.mediumGrey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Global.lightGreen,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: Text(
                              item["category"],
                              style: const TextStyle(
                                color: Global.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
            ),
          ),
        ),
      );
}
