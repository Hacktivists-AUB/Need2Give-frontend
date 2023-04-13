import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/widgets/textfield.dart';

class ItemPage extends StatelessWidget {
  static const String routeName = '/item';
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final item =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item"),
        centerTitle: true,
      ),
      backgroundColor: Global.lightGrey,
      body: Container(
        color: Global.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/cart.png'),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(36),
                decoration: const BoxDecoration(
                  color: Global.lightGrey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item["name"],
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Global.lightGreen,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            item["category"],
                            style: const TextStyle(
                              color: Global.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Divider(),
                    Row(
                      children: [
                        const Icon(
                          Icons.account_balance,
                          color: Global.mediumGrey,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            item["center"],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Global.mediumGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.stacked_bar_chart,
                          color: Global.mediumGrey,
                          size: 14,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Quantity: ${item["quantity"]}",
                          style: const TextStyle(
                            color: Global.mediumGrey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Label(text: "Description"),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item["description"],
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Global.mediumGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
