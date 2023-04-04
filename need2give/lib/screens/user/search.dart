import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:need2give/constants/global.dart';

enum SearchMode {
  all,
  onlyItems,
  onlyDonationCenters,
}

class Search extends StatefulWidget {
  static const String routeName = '/searchbar';
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with TickerProviderStateMixin {
  SearchMode _searchMode = SearchMode.all;
  final TextEditingController _searchController = TextEditingController();
  late final TabController _tabController;

  final _tabsAll = const [
    Tab(
      icon: FaIcon(
        FontAwesomeIcons.box,
        size: 20,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.account_balance,
        size: 20,
      ),
    ),
  ];

  final _tabsItems = const [
    Tab(
      icon: FaIcon(
        FontAwesomeIcons.box,
        size: 20,
      ),
    ),
  ];

  final _tabsDonationCenters = const [
    Tab(
      icon: Icon(
        Icons.account_balance,
        size: 20,
      ),
    ),
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
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    if (_searchMode == SearchMode.all || _searchMode == SearchMode.onlyItems) {
      _foundItems = _items;
    }
    if (_searchMode == SearchMode.all ||
        _searchMode == SearchMode.onlyDonationCenters) {
      _foundDonationCenters = _donationCenters;
    }
    _tabController = TabController(
      length: _searchMode == SearchMode.all ? 2 : 1,
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

  void _filter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty || enteredKeyword == "") {
      if (_searchMode == SearchMode.onlyItems) {
        results = _items;
      } else if (_searchMode == SearchMode.onlyDonationCenters) {
        results = _donationCenters;
      } else {
        results = _currentTabIndex == 0 ? _items : _donationCenters;
      }
    } else {
      if (_searchMode == SearchMode.onlyItems) {
        results = _items
            .where((object) => object["name"]
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      } else if (_searchMode == SearchMode.onlyDonationCenters) {
        results = _donationCenters
            .where((object) => object["name"]
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      } else {
        results = _currentTabIndex == 0
            ? _items
                .where((object) => object["name"]
                    .toLowerCase()
                    .contains(enteredKeyword.toLowerCase()))
                .toList()
            : _donationCenters
                .where((object) => object["name"]
                    .toLowerCase()
                    .contains(enteredKeyword.toLowerCase()))
                .toList();
      }
    }

    setState(() {
      if (_searchMode == SearchMode.onlyItems) {
        _foundItems = results;
      } else if (_searchMode == SearchMode.onlyDonationCenters) {
        _foundDonationCenters = results;
      } else {
        _currentTabIndex == 0
            ? _foundItems = results
            : _foundDonationCenters = results;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _searchMode = arguments['searchMode'];
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
          tabs: _searchMode == SearchMode.all
              ? _tabsAll
              : _searchMode == SearchMode.onlyItems
                  ? _tabsItems
                  : _tabsDonationCenters,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _searchMode == SearchMode.all
            ? [
                _buildListView(_foundItems),
                _buildListView(_foundDonationCenters),
              ]
            : _searchMode == SearchMode.onlyItems
                ? [_buildListView(_foundItems)]
                : [_buildListView(_foundDonationCenters)],
      ),
    );
  }

  Widget _buildListView(List<Map<String, dynamic>> objects) => ListView.builder(
        itemCount: objects.length,
        itemBuilder: (BuildContext context, int index) => Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            title: Text(objects[index]['name']),
            subtitle: Text(objects[index]["description"].toString()),
          ),
        ),
      );
}
