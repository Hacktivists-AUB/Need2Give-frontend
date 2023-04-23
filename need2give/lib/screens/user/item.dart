import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/item.dart';
import 'package:need2give/screens/donation_center/update_item.dart';
import 'package:need2give/widgets/textfield.dart';

class ItemPage extends StatelessWidget {
  static const String routeName = '/item';
  final Item item;
  final bool editable;
  const ItemPage({
    super.key,
    required this.item,
    this.editable = false,
  });

  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.fromLTRB(20, 20, 20, editable ? 6 : 20),
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
                            item.name.length > 14
                                ? "${item.name.substring(0, 14)}..."
                                : item.name,
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
                            item.category[0].toUpperCase() +
                                item.category.substring(1),
                            style: const TextStyle(
                              color: Global.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    if (item.name.length > 14)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.name,
                        ),
                      ),
                    const SizedBox(height: 6),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        DateFormat("'Added on 'd MMM ',' yyyy 'at' hh:mm")
                            .format(DateTime.parse(item.createdAt)),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Global.mediumGrey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
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
                            item.donationCenter.name,
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
                          "Quantity: ${item.quantity}",
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
                        item.description!,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Global.mediumGrey,
                        ),
                      ),
                    ),
                    if (editable) _buildEditableButtons(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableButtons(BuildContext ctx) => Column(
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Delete",
                  style: TextStyle(color: Global.markerColor),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(ctx, UpdateItem.routeName,
                      arguments: item);
                },
                child: const Text("Edit"),
              ),
            ],
          ),
        ],
      );
}
