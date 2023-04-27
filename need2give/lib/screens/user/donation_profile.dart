import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/donation_center.dart';
import 'package:need2give/screens/donation_center/about_us.dart';
import 'package:need2give/screens/donation_center/inventory.dart';
import 'package:need2give/services/account_service.dart';

class DonationScreen extends StatefulWidget {
  static const routeName = "/viewDonationCenter";
  final int id;
  const DonationScreen({
    super.key,
    required this.id,
  });

  @override
  State<DonationScreen> createState() => _DonationScreen();
}

class _DonationScreen extends State<DonationScreen>
    with SingleTickerProviderStateMixin {
  final AccountService _accountService = AccountService();
  late TabController _tabController;

  DonationCenter _donationCenter = DonationCenter(
    id: 0,
    token: "",
    createdAt: "2000-01-01T00:00:00.000Z",
    username: "",
    phoneNumber: "",
    email: "",
    name: "",
    latitude: 0,
    longitude: 0,
    openingTime: "",
    closingTime: "",
    description: "",
    openingDays: {},
    distance: 0,
  );
  final double _coverHeight = 140;
  final double _pfpHeight = 108;

  void follow(BuildContext ctx) async {
    await _accountService.follow(ctx, widget.id);
    setState(() {});
  }

  void unfollow(BuildContext ctx) async {
    await _accountService.unfollow(ctx, widget.id);
    setState(() {});
  }

  _loadProfile() async {
    _donationCenter = await _accountService.getById(context, widget.id);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadProfile();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.backgroundColor,
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(_donationCenter.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBanner(),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _donationCenter.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "@${_donationCenter.username}",
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
                        DateTime.parse(_donationCenter.createdAt),
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
                AboutUs(donationCenter: _donationCenter),
                Inventory(id: _donationCenter.id),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner() => Stack(
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
                  if (_donationCenter.following) {
                    unfollow(context);
                  } else {
                    follow(context);
                  }
                  setState(() {
                    _donationCenter.following = !_donationCenter.following;
                  });
                },
                child: Text(
                  _donationCenter.following ? "Following" : "Follow",
                ),
              ),
            ),
          ),
        ],
      );
}
