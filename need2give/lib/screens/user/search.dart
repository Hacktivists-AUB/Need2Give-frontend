import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:need2give/constants/global.dart';

class Search extends StatefulWidget {
  static const String routeName = '/searchbar';
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late final TabController _tabController;

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
    _foundItems = _items;
    _foundDonationCenters = _donationCenters;
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    _tabController.addListener(() {
      _currentTabIndex = _tabController.index;
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _filter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _currentTabIndex == 0 ? _items : _donationCenters;
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

    setState(() {
      if (_currentTabIndex == 0) {
        _foundItems = results;
      } else {
        _foundDonationCenters = results;
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
          tabs: const [
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
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildListView(_foundItems),
          buildListView(_foundDonationCenters)
        ],
      ),
    );
  }

  Widget buildListView(List<Map<String, dynamic>> objects) => ListView.builder(
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
