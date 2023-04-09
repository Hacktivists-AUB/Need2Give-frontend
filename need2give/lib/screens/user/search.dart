import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:need2give/constants/global.dart';

enum SearchMode {
  all,
  onlyItems,
  onlyDonationCenters,
}

enum TabType {
  item,
  donationCenter,
  category,
}

class Search extends StatefulWidget {
  static const String routeName = '/searchbar';
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  SearchMode _searchMode = SearchMode.all;
  late TabController _tabController;

  final List<Map<String, dynamic>> _categories = [
    {
      "id": 1,
      "name": "All",
    },
    {
      "id": 2,
      "name": "Food",
    },
    {
      "id": 3,
      "name": "Medicine",
    },
    {
      "id": 4,
      "name": "Clothing",
    },
    {
      "id": 5,
      "name": "Electronics",
    },
    {
      "id": 6,
      "name": "Other",
    }
  ];

  final List<Map<String, dynamic>> _items = [
    {"id": 1, "name": "Panadol", "description": "very gud item"},
    {"id": 2, "name": "Rice", "description": "very gud item"},
    {"id": 3, "name": "Noodles", "description": "very gud item"},
    {"id": 4, "name": "Shirt", "description": "very gud item"},
    {"id": 5, "name": "Candy", "description": "very gud item"},
    {"id": 6, "name": "Oil", "description": "very gud item"},
    {"id": 7, "name": "Dress", "description": "very gud item"},
    {"id": 8, "name": "Advil", "description": "very gud item"},
    {"id": 9, "name": "Cough syrup", "description": "very gud item"},
    {"id": 10, "name": "Stuffed animal", "description": "very gud item"},
  ];

  final List<Map<String, dynamic>> _donationCenters = [
    {
      "id": 1,
      "name": "Sweet tooth pharmacy",
      "description": "very gud donation center"
    },
    {
      "id": 2,
      "name": "Ubi's nice donation center",
      "description": "very gud donation center"
    },
    {
      "id": 3,
      "name": "Buni's nice donation center",
      "description": "very gud donation center"
    },
    {
      "id": 4,
      "name": "Dummy donation center",
      "description": "very gud donation center"
    },
    {
      "id": 5,
      "name": "Donation center dummy",
      "description": "very gud donation center"
    },
    {
      "id": 6,
      "name": "Very good NGO",
      "description": "very gud donation center"
    },
    {
      "id": 7,
      "name": "Not that gud but still gud NGO",
      "description": "very gud donation center"
    },
    {
      "id": 8,
      "name": "Lorem ispum center",
      "description": "very gud donation center"
    },
    {
      "id": 9,
      "name": "Doloris center",
      "description": "very gud donation center"
    },
    {
      "id": 10,
      "name": "Stuffed animal",
      "description": "very gud donation center"
    },
  ];

  List<Map<String, dynamic>> _foundItems = [];
  List<Map<String, dynamic>> _foundDonationCenters = [];
  List<Map<String, dynamic>> _foundCategories = [];
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    switch (_searchMode) {
      case SearchMode.onlyItems:
        _foundItems = _items;
        break;
      case SearchMode.onlyDonationCenters:
        _foundDonationCenters = _donationCenters;
        break;
      case SearchMode.all:
        _foundItems = _items;
        _foundDonationCenters = _donationCenters;
        _foundCategories = _categories;
        break;
    }
    _tabController = TabController(
      length: _searchMode == SearchMode.all ? 3 : 1,
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

  List<Map<String, dynamic>> _getSimilarResults(
      List<Map<String, dynamic>> list, String keyword) {
    return list
        .where((object) =>
            object["name"].toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }

  void _filter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty || enteredKeyword == "") {
      switch (_searchMode) {
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
            case 2:
              results = _categories;
              break;
          }
      }
    } else {
      switch (_searchMode) {
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
            case 2:
              results = _getSimilarResults(_categories, enteredKeyword);
              break;
          }
      }
    }

    setState(() {
      if (_searchMode == SearchMode.onlyItems) {
        _foundItems = results;
      } else if (_searchMode == SearchMode.onlyDonationCenters) {
        _foundDonationCenters = results;
      } else {
        switch (_currentTabIndex) {
          case 0:
            _foundItems = results;
            break;
          case 1:
            _foundDonationCenters = results;
            break;
          case 2:
            _foundCategories = results;
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _searchMode = (ModalRoute.of(context)!.settings.arguments
        as Map<String, dynamic>)['searchMode'];

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
          tabs: _generateTabs(_searchMode),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _generateTabView(_searchMode),
      ),
    );
  }

  List<Widget> _generateTabView(SearchMode mode) {
    switch (mode) {
      case SearchMode.all:
        return [
          _buildListView(_foundItems),
          _buildListView(_foundDonationCenters),
          _buildListView(_foundCategories, withSubtitle: false),
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
      case TabType.category:
        return const Tab(
          icon: Icon(
            Icons.category,
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
          _generateTab(TabType.category),
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

  Widget _buildListView(List<Map<String, dynamic>> objects,
          {bool withSubtitle = true}) =>
      ListView.builder(
        itemCount: objects.length,
        itemBuilder: (BuildContext context, int index) => Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: withSubtitle
              ? ListTile(
                  title: Text(objects[index]["name"]),
                  subtitle: Text(objects[index]["description"]),
                )
              : ListTile(
                  title: Text(objects[index]["name"]),
                ),
        ),
      );
}
