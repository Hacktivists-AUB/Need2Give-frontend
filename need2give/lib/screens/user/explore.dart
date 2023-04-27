// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/donation_center.dart';
import 'package:need2give/models/item.dart';
import 'package:need2give/screens/user/category.dart';
import 'package:need2give/screens/user/donation_profile.dart';
import 'package:need2give/screens/user/search.dart';
import 'package:need2give/services/account_service.dart';
import 'package:need2give/services/item_service.dart';
import 'package:need2give/widgets/item.dart';
import 'package:need2give/widgets/textfield.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final ItemService _itemService = ItemService();
  final AccountService _donationCenterService = AccountService();
  final List<String> _categories = [
    "All",
    "Food",
    "Medication",
    "Clothes",
    "Electronics",
    "Other",
  ];

  List<DonationCenter> _donationCenters = [];
  List<Item> _items = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    _items = await _itemService.get(context, {});
    _donationCenters = await _donationCenterService.get(context, {});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.backgroundColor,
      appBar: AppBar(
        title: const Text("Explore"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: SearchBar(
                      searchMode: SearchMode.all,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/map");
                    },
                    icon: const Icon(
                      Icons.location_on_sharp,
                      size: 36,
                      color: Global.darkGreen,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                height: 48.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                      _categories.map((e) => _buildCategoryTag(e)).toList(),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Discover donation centers",
                  style: TextStyle(
                    fontSize: 20,
                    color: Global.darkGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                height: 300.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _donationCenters
                      .map((e) => _buildDonationCenterCard(e))
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "See our newest items",
                  style: TextStyle(
                    fontSize: 20,
                    color: Global.darkGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: _items.map((e) => ItemListTile(item: e)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTag(String category) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Global.lightGreen,
        ),
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              Category.routeName,
              arguments: category,
            );
          },
          child: Text(
            category,
            style: const TextStyle(color: Global.white),
          ),
        ),
      );

  Widget _buildDonationCenterCard(DonationCenter center) => Hero(
        tag: "center/${center.id}",
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: 260,
            margin: const EdgeInsets.only(right: 18),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Global.lightGrey,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/donation_center.png",
                    height: 200,
                  ),
                ),
                Text(
                  center.name,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Global.mediumGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(center.description.length > 28
                    ? "${center.description.substring(0, 28)}..."
                    : center.description),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          DonationScreen.routeName,
                          arguments: center.id,
                        );
                      },
                      child: const Text("See more"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
