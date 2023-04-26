import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/donation_center.dart';
import 'package:need2give/models/item.dart';
import 'package:need2give/screens/user/search.dart';
import 'package:need2give/services/account_service.dart';
import 'package:need2give/services/item_service.dart';
import 'package:need2give/widgets/donation_center_card.dart';
import 'package:need2give/widgets/item.dart';

class SearchResult extends StatefulWidget {
  static const String routeName = "/searchResult";
  final String searchStr;
  final SearchMode searchMode;
  const SearchResult({
    super.key,
    required this.searchStr,
    required this.searchMode,
  });

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final ItemService _itemService = ItemService();
  final AccountService _accountService = AccountService();
  List<Item> _items = [];
  List<DonationCenter> _donationCenters = [];

  @override
  void initState() {
    super.initState();
    _loadSearchResults();
  }

  _loadSearchResults() async {
    if (widget.searchMode == SearchMode.onlyItems) {
      _items = await _itemService.get(context, {"name": widget.searchStr});
    } else if (widget.searchMode == SearchMode.onlyDonationCenters) {
      _donationCenters =
          await _accountService.get(context, {"name": widget.searchStr});
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Found ${widget.searchMode == SearchMode.onlyItems ? _items.length : _donationCenters.length} items",
                  style: const TextStyle(
                    color: Global.mediumGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Column(
                children: widget.searchMode == SearchMode.onlyItems
                    ? _items.map((e) => ItemListTile(item: e)).toList()
                    : _donationCenters
                        .map((e) => DonationCenterCard(donationCenter: e))
                        .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
