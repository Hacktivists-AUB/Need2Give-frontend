import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/donation_center.dart';
import 'package:need2give/provider/auth_provider.dart';
import 'package:need2give/widgets/profile_content.dart';
import 'package:provider/provider.dart';

class DonationCenterProfile extends StatefulWidget {
  static const routeName = "/donationCenterProfile";
  const DonationCenterProfile({
    super.key,
  });

  @override
  State<DonationCenterProfile> createState() => _DonationCenterProfile();
}

class _DonationCenterProfile extends State<DonationCenterProfile> {
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
      body: ProfileContent(
        donationCenter: donationCenter,
        viewMode: ViewMode.donationCenter,
      ),
    );
  }
}
