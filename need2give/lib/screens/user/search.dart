// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/donation_center.dart';
import 'package:need2give/models/item.dart';
import 'package:need2give/screens/user/donation_profile.dart';
import 'package:need2give/screens/user/item.dart';
import 'package:need2give/services/account_service.dart';
import 'package:need2give/services/item_service.dart';

enum SearchMode {
  all,
  onlyItems,
  onlyDonationCenters,
}

enum TabType {
  item,
  donationCenter,
}

class Search extends StatefulWidget {
  static const String routeName = '/searchbar';
  final SearchMode searchMode;
  const Search({
    super.key,
    required this.searchMode,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;

  final ItemService _itemService = ItemService();
  final AccountService _donationCenterService = AccountService();

  List<Item> _items = [];
  List<Item> _foundItems = [];
  List<DonationCenter> _donationCenters = [];
  List<DonationCenter> _foundDonationCenters = [];

  int _currentTabIndex = 0;

  _loadData() async {
    _items = await _itemService.get(context, {});
    _donationCenters = await _donationCenterService.get(context, {});
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _loadData();

    switch (widget.searchMode) {
      case SearchMode.onlyItems:
        _foundItems = _items;
        break;
      case SearchMode.onlyDonationCenters:
        _foundDonationCenters = _donationCenters;
        break;
      case SearchMode.all:
        _foundItems = _items;
        _foundDonationCenters = _donationCenters;
        break;
    }
    _tabController = TabController(
      length: widget.searchMode == SearchMode.all ? 2 : 1,
      vsync: this,
      initialIndex: 0,
    );
    _tabController.addListener(() {
      _currentTabIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  List<dynamic> _getSimilarResults(List<dynamic> list, String str) {
    return list
        .where((e) => e.name.toLowerCase().contains(str.toLowerCase()))
        .toList();
  }

  void _filter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty || enteredKeyword == "") {
      switch (widget.searchMode) {
        case SearchMode.onlyItems:
          results = _items;
          break;
        case SearchMode.onlyDonationCenters:
          results = _donationCenters;
          break;
        case SearchMode.all:
          switch (_currentTabIndex) {
            case 0:
              results = _items;
              break;
            case 1:
              results = _donationCenters;
              break;
          }
      }
    } else {
      switch (widget.searchMode) {
        case SearchMode.onlyItems:
          results = _getSimilarResults(_items, enteredKeyword);
          break;
        case SearchMode.onlyDonationCenters:
          results = _getSimilarResults(_donationCenters, enteredKeyword);
          break;
        case SearchMode.all:
          switch (_currentTabIndex) {
            case 0:
              results = _getSimilarResults(_items, enteredKeyword);
              break;
            case 1:
              results = _getSimilarResults(_donationCenters, enteredKeyword);
              break;
          }
      }
    }

    setState(() {
      if (widget.searchMode == SearchMode.onlyItems) {
        _foundItems = results as List<Item>;
      } else if (widget.searchMode == SearchMode.onlyDonationCenters) {
        _foundDonationCenters = results as List<DonationCenter>;
      } else {
        switch (_currentTabIndex) {
          case 0:
            _foundItems = results as List<Item>;
            break;
          case 1:
            _foundDonationCenters = results as List<DonationCenter>;
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 8,
        title: SizedBox(
          height: 36,
          child: TextField(
            controller: _searchController,
            style: const TextStyle(fontSize: 14),
            onChanged: (value) => _filter(value),
            decoration: InputDecoration(
              filled: true,
              fillColor: Global.white,
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.clear,
                ),
                onPressed: () {
                  _searchController.clear();
                  _filter(_searchController.text);
                },
              ),
              hintText: 'Search',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              hintStyle: const TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black38,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Global.darkGreen,
          tabs: _generateTabs(widget.searchMode),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _generateTabView(widget.searchMode),
      ),
    );
  }

  List<Widget> _generateTabView(SearchMode mode) {
    switch (mode) {
      case SearchMode.all:
        return [
          _buildListView(_foundItems),
          _buildListView(_foundDonationCenters),
        ];
      case SearchMode.onlyDonationCenters:
        return [
          _buildListView(_foundDonationCenters),
        ];
      case SearchMode.onlyItems:
        return [
          _buildListView(_foundItems),
        ];
    }
  }

  Tab _generateTab(TabType type) {
    switch (type) {
      case TabType.item:
        return const Tab(
          icon: FaIcon(
            FontAwesomeIcons.box,
            size: 20,
          ),
        );
      case TabType.donationCenter:
        return const Tab(
          icon: Icon(
            Icons.account_balance,
            size: 20,
          ),
        );
    }
  }

  List<Tab> _generateTabs(SearchMode mode) {
    switch (mode) {
      case SearchMode.all:
        return [
          _generateTab(TabType.item),
          _generateTab(TabType.donationCenter),
        ];
      case SearchMode.onlyDonationCenters:
        return [
          _generateTab(TabType.donationCenter),
        ];
      case SearchMode.onlyItems:
        return [
          _generateTab(TabType.item),
        ];
    }
  }

  Widget _buildListView(List<dynamic> objects) => Container(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: objects.length,
          itemBuilder: (BuildContext context, int index) => Card(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                switch (widget.searchMode) {
                  case SearchMode.onlyItems:
                    Navigator.pushNamed(
                      context,
                      ItemPage.routeName,
                      arguments: {"item": objects[index], "editable": false},
                    );
                    break;
                  case SearchMode.onlyDonationCenters:
                    Navigator.pushNamed(
                      context,
                      DonationScreen.routeName,
                      arguments: objects[index],
                    );
                    break;
                  case SearchMode.all:
                    switch (_currentTabIndex) {
                      case 0:
                        Navigator.pushNamed(
                          context,
                          ItemPage.routeName,
                          arguments: {
                            "item": objects[index],
                            "editable": false
                          },
                        );
                        break;
                      case 1:
                        Navigator.pushNamed(
                          context,
                          DonationScreen.routeName,
                          arguments: objects[index],
                        );
                        break;
                    }
                }
              },
              child: ListTile(
                title: Text(objects[index].name),
                subtitle: Text(
                  objects[index].description.length > 42
                      ? "${objects[index].description.substring(0, 42)}..."
                      : objects[index].description,
                ),
              ),
            ),
          ),
        ),
      );
}
