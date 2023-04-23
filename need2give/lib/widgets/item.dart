import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/item.dart';
import 'package:need2give/screens/donation_center/update_item.dart';
import 'package:need2give/screens/main_pages_navbar/button_navbar.dart';
import 'package:need2give/screens/user/item.dart';
import 'package:need2give/services/item_service.dart';

class ItemListTile extends StatefulWidget {
  final Item item;
  final bool editable;
  const ItemListTile({
    super.key,
    required this.item,
    this.editable = false,
  });

  @override
  State<ItemListTile> createState() => _ItemListTileState();
}

class _ItemListTileState extends State<ItemListTile> {
  final ItemService _itemService = ItemService();

  void delete(BuildContext ctx) {
    _itemService.delete(ctx, widget.item.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ItemPage.routeName,
          arguments: {"item": widget.item, "editable": widget.editable},
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 18),
        padding: EdgeInsets.fromLTRB(20, 20, 20, widget.editable ? 8 : 20),
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
                          widget.item.name.length > 20
                              ? "${widget.item.name.substring(0, 20)}..."
                              : widget.item.name,
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
                            widget.item.donationCenter.name,
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
                                .format(DateTime.parse(widget.item.createdAt)),
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
                          widget.item.description!.length < 24
                              ? widget.item.description!
                              : "${widget.item.description!.substring(0, 24)}...",
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
                              widget.item.category[0].toUpperCase() +
                                  widget.item.category.substring(1),
                              style: const TextStyle(
                                color: Global.white,
                              ),
                            ),
                          ),
                          Text(
                            "Quantity: ${widget.item.quantity}",
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
            if (widget.editable) _buildEditableButtons(context),
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
                onPressed: () {
                  showGeneralDialog(
                    context: ctx,
                    pageBuilder: (BuildContext buildContext,
                        Animation animation, Animation secondaryAnimation) {
                      return AlertDialog(
                        title: const Text("Delete item"),
                        content: Text(
                            "Are you sure you want to delete '${widget.item.name}'?"),
                        actions: [
                          TextButton(
                            child: const Text("Cancel"),
                            onPressed: () {
                              Navigator.of(ctx).pop(false);
                            },
                          ),
                          TextButton(
                            child: const Text(
                              "Delete",
                              style: TextStyle(color: Global.markerColor),
                            ),
                            onPressed: () {
                              delete(ctx);
                              Navigator.pushNamed(ctx, ButtonNavbar.routeName);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  "Delete",
                  style: TextStyle(color: Global.markerColor),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(ctx, UpdateItem.routeName,
                      arguments: widget.item);
                },
                child: const Text("Edit"),
              ),
            ],
          ),
        ],
      );
}
