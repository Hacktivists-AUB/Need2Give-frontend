import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/constants/utils.dart';
import 'package:need2give/models/item.dart';
import 'package:need2give/screens/user/donation_profile.dart';
import 'package:need2give/screens/user/item.dart';

class PostComponent extends StatelessWidget {
  final Item item;

  const PostComponent({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  DonationScreen.routeName,
                  arguments: item.donationCenter.id,
                );
              },
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Global.green,
                        width: 2,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/donation_center.png",
                        width: 42,
                        height: 42,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    item.donationCenter.name.length > 28
                        ? "${item.donationCenter.name.substring(0, 28)}..."
                        : item.donationCenter.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            const Divider(),
            const SizedBox(height: 6),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ItemPage.routeName,
                  arguments: {"item": item, "editable": false},
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.name.length > 24
                              ? "${item.name.substring(0, 24)}..."
                              : item.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: getCategoryColor(item.category),
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
                  const SizedBox(height: 8),
                  Image.asset(
                    "assets/${item.category}.png",
                    scale: 5,
                    height: 150,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.description!,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    DateFormat("'Posted on 'd MMM ',' yyyy 'at' hh:mm")
                        .format(DateTime.parse(item.createdAt)),
                    style: const TextStyle(
                      color: Global.mediumGrey,
                      fontStyle: FontStyle.italic,
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
}
