import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/donation_center.dart';
import 'package:need2give/services/account_service.dart';
import 'package:need2give/widgets/profile_content.dart';

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

class _DonationScreen extends State<DonationScreen> {
  final AccountService _donationCenterService = AccountService();
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

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  _loadProfile() async {
    _donationCenter = await _donationCenterService.getById(context, widget.id);
    setState(() {});
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
      body: ProfileContent(donationCenter: _donationCenter),
    );
  }
}
