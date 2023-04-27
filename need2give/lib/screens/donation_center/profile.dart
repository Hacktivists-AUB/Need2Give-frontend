import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/donation_center.dart';
import 'package:need2give/provider/auth_provider.dart';
import 'package:need2give/screens/donation_center/about_us.dart';
import 'package:need2give/screens/donation_center/edit_profile.dart';
import 'package:need2give/screens/donation_center/inventory.dart';
import 'package:provider/provider.dart';

class DonationCenterProfile extends StatefulWidget {
  static const routeName = "/donationCenterProfile";
  const DonationCenterProfile({
    super.key,
  });

  @override
  State<DonationCenterProfile> createState() => _DonationCenterProfile();
}

class _DonationCenterProfile extends State<DonationCenterProfile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final double _coverHeight = 140;
  final double _pfpHeight = 108;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final donationCenter =
        Provider.of<AuthProvider>(context).profile as DonationCenter;
    return Scaffold(
      backgroundColor: Global.backgroundColor,
      appBar: AppBar(
        title: Text(donationCenter.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBanner(donationCenter),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  donationCenter.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "@${donationCenter.username}",
                  style: const TextStyle(
                    color: Global.mediumGrey,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Global.mediumGrey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      DateFormat("'Joined 'MMMM yyyy").format(
                        DateTime.parse(donationCenter.createdAt),
                      ),
                      style: const TextStyle(
                        color: Global.mediumGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: Global.darkGreen,
            tabs: const [
              Tab(
                child: Text(
                  "About us",
                  style: TextStyle(
                    color: Global.green,
                    fontSize: 14,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Inventory",
                  style: TextStyle(
                    color: Global.green,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                AboutUs(donationCenter: donationCenter),
                Inventory(id: donationCenter.id),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner(DonationCenter donationCenter) => Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            color: Global.darkGreen,
            width: double.infinity,
            height: _coverHeight,
            margin: EdgeInsets.only(bottom: _pfpHeight * 0.5),
          ),
          Positioned(
            top: _coverHeight - _pfpHeight * 0.5,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Global.backgroundColor, width: 8.0),
              ),
              child: CircleAvatar(
                radius: _pfpHeight * 0.5,
                backgroundColor: Global.white,
                child: Image.asset("assets/donation_center.png"),
              ),
            ),
          ),
          Positioned(
            top: _coverHeight,
            right: 20,
            child: Container(
              height: 42,
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Global.green),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    EditProfile.routeName,
                    arguments: donationCenter,
                  );
                },
                child: const Text(
                  "Edit profile",
                ),
              ),
            ),
          ),
        ],
      );
}
