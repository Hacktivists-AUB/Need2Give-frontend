import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/donation_center.dart';
import 'package:need2give/models/user.dart';
import 'package:need2give/provider/auth_provider.dart';
import 'package:need2give/screens/user/edit_profile.dart';
import 'package:need2give/services/account_service.dart';
import 'package:need2give/widgets/donation_center_card.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AccountService _accountService = AccountService();

  final double _coverHeight = 140;
  final double _pfpHeight = 108;

  List<DonationCenter> _donationCenters = [];

  _loadFollowingAccounts() async {
    _donationCenters = await _accountService.get(context, {});
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadFollowingAccounts();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).profile as User;
    return Scaffold(
      backgroundColor: Global.backgroundColor,
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBanner(user),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.fullName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "@${user.username}",
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
                        DateTime.parse(user.createdAt),
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
            tabs: [
              const Tab(
                child: Text(
                  "User info",
                  style: TextStyle(
                    color: Global.green,
                    fontSize: 14,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "${_donationCenters.length} Following",
                  style: const TextStyle(
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
                _buildUserInfo(user),
                _buildFollowingList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(User user) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Conact info",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Global.darkGrey,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.mail,
                color: Global.mediumGrey,
              ),
              const SizedBox(width: 8),
              Text(
                user.email,
                style: const TextStyle(
                  color: Global.mediumGrey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.phone,
                color: Global.mediumGrey,
              ),
              const SizedBox(width: 8),
              Text(
                (user.phoneNumber == null || user.phoneNumber == "")
                    ? "N/A"
                    : user.phoneNumber!,
                style: const TextStyle(
                  color: Global.mediumGrey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            "Additional",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Global.darkGrey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            DateFormat("'Birthday: 'MMMM dd, yyyy").format(
              DateTime.parse(user.birthDate),
            ),
            style: const TextStyle(
              color: Global.mediumGrey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner(User user) => Stack(
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
                child: const Icon(
                  Icons.person,
                  size: 72,
                  color: Global.mediumGrey,
                ),
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
                child: const Text("Edit profile"),
                onPressed: () {
                  Navigator.pushNamed(context, EditProfile.routeName, arguments: user,);
                },
              ),
            ),
          ),
        ],
      );

  Widget _buildFollowingList() => Container(
        padding: const EdgeInsets.all(18),
        child: ListView.builder(
          itemCount: _donationCenters.length,
          itemBuilder: (BuildContext context, int index) => DonationCenterCard(
            donationCenter: _donationCenters[index],
          ),
        ),
      );
}
