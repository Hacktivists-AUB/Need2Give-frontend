import 'package:need2give/constants/global.dart';
import 'package:need2give/screens/user/donation%20center/about_us_donation_center.dart';
import 'package:need2give/screens/user/donation%20center/inventory.dart';
import 'package:need2give/widgets/button.dart';

import 'package:flutter/material.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DonationScreen createState() => _DonationScreen();
}

class _DonationScreen extends State<DonationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Global.backgroundColor,
      appBar: AppBar(
        title: const Text("Donation center"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset("assets/donation_center.png"),
              ),
              const Text(
                "Donation center name",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1.0,
                  fontFamily: "Helvetica",
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Button(text: "Follow", onPressed: () {}),
          ),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                child: Text(
                  "About us",
                  style: TextStyle(color: Global.green, fontSize: 14),
                ),
              ),
              Tab(
                child: Text(
                  "Inventory",
                  style: TextStyle(color: Global.green, fontSize: 14),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Center(
                    child: Padding(
                  padding: EdgeInsets.all(10),
                  child: AboutUs(),
                )),
                Center(child: Padding(
                  padding: EdgeInsets.all(10),
                  child: inventory(),
                )),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}