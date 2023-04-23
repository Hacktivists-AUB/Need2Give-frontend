import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/item.dart';
import 'package:need2give/provider/auth_provider.dart';
import 'package:need2give/screens/donation_center/add_item.dart';
import 'package:need2give/screens/donation_center/view_items.dart';
import 'package:need2give/services/item_service.dart';
import 'package:need2give/widgets/item.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = '/dashboard';

  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  final int _totalStock = 150;
  final int _totalDonationsRecieved = 68;
  final int _totalDonationsGiven = 72;

  final ItemService _itemService = ItemService();
  List<Item> _items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  _loadItems() async {
    _items = await _itemService.get(
      context,
      {
        "donation_center_id":
            Provider.of<AuthProvider>(context, listen: false).profile.id
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.backgroundColor,
      appBar: AppBar(
        title: const Text("Your Dashboard"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hi ${Provider.of<AuthProvider>(context, listen: false).profile.username}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Global.darkGrey,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Statistics",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Global.darkGrey,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: 'Number of items per month'),
                series: <LineSeries<ItemData, String>>[
                  LineSeries<ItemData, String>(
                    dataSource: <ItemData>[
                      ItemData('Jan', 35),
                      ItemData('Feb', 28),
                      ItemData('Mar', 34),
                      ItemData('Apr', 32),
                      ItemData('May', 40)
                    ],
                    xValueMapper: (ItemData amount, _) => amount.month,
                    yValueMapper: (ItemData amount, _) => amount.amount,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Summary",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Global.darkGrey,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Global.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  border: Border.all(
                    color: Global.green,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    _buildSummaryStat(
                      FontAwesomeIcons.cubes,
                      _totalStock,
                      "Total stock",
                    ),
                    const SizedBox(height: 16),
                    _buildSummaryStat(
                      FontAwesomeIcons.boxOpen,
                      _totalDonationsRecieved,
                      "Donations recieved",
                    ),
                    const SizedBox(height: 16),
                    _buildSummaryStat(
                      FontAwesomeIcons.handsHelping,
                      _totalDonationsGiven,
                      "Donations given",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Inventory",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Global.darkGrey,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Currently in stock",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddItem(),
                        ),
                      );
                    },
                    child: const Text(
                      "Add item",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              ..._items
                  .map((e) => ItemListTile(item: e, editable: true))
                  .toList(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ViewAllItems.routeName);
                  },
                  child: const Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryIcon(IconData icon) => Container(
        width: 54,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Global.lightGreen,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Center(
          child: FaIcon(
            icon,
            color: Global.white,
          ),
        ),
      );

  Widget _buildSummaryStat(IconData icon, int val, String text) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildSummaryIcon(icon),
              const SizedBox(width: 8),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Global.mediumGrey,
                ),
              ),
            ],
          ),
          Text(
            "$val",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Global.mediumGrey,
            ),
          ),
        ],
      );
}

class ItemData {
  ItemData(this.month, this.amount);
  final String month;
  final double amount;
}
