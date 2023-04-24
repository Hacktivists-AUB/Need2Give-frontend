import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/donation_center.dart';
import 'package:need2give/widgets/profile_content.dart';

class DonationScreen extends StatefulWidget {
  static const routeName = "/viewDonationCenter";
  final DonationCenter donationCenter;
  const DonationScreen({
    super.key,
    required this.donationCenter,
  });

  @override
  State<DonationScreen> createState() => _DonationScreen();
}

class _DonationScreen extends State<DonationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.backgroundColor,
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(widget.donationCenter.name),
        centerTitle: true,
      ),
      body: ProfileContent(donationCenter: widget.donationCenter),
    );
  }
}
