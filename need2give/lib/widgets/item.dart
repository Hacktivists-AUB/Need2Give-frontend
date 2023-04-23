import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/item.dart';
import 'package:need2give/screens/donation_center/update_item.dart';
import 'package:need2give/screens/user/item.dart';

class ItemListTile extends StatelessWidget {
  final Item item;
  final bool editable;
  const ItemListTile({
    super.key,
    required this.item,
    this.editable = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ItemPage.routeName,
          arguments: item,
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 18),
        padding: EdgeInsets.fromLTRB(20, 20, 20, editable ? 8 : 20),
        decoration: const BoxDecoration(
          color: Global.lightGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/cart.png", height: 54),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Global.darkGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Divider(),
                      Row(
                        children: [
                          const Icon(
                            Icons.account_balance,
                            color: Global.mediumGrey,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            item.donationCenter.name,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Global.mediumGrey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: Global.mediumGrey,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            DateFormat("d MMM ',' yyyy")
                                .format(DateTime.parse(item.createdAt)),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Global.mediumGrey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.description!.length < 24
                              ? item.description!
                              : "${item.description!.substring(0, 24)}...",
                          style: const TextStyle(
                            color: Global.mediumGrey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Global.lightGreen,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: Text(
                              item.category[0].toUpperCase() +
                                  item.category.substring(1),
                              style: const TextStyle(
                                color: Global.white,
                              ),
                            ),
                          ),
                          Text(
                            "Quantity: ${item.quantity}",
                            style: const TextStyle(
                              color: Global.mediumGrey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (editable) _buildEditableButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableButtons(BuildContext ctx) => Column(
        children: [
          const SizedBox(height: 6),
          const Divider(),
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
                  Navigator.pushNamed(ctx, UpdateItem.routeName);
                },
                child: const Text("Edit"),
              ),
            ],
          ),
        ],
      );
}
