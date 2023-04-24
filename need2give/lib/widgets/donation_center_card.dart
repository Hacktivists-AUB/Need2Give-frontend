import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/donation_center.dart';
import 'package:need2give/screens/user/donation_center/profile_screen.dart';

class DonationCenterCard extends StatelessWidget {
  final DonationCenter donationCenter;
  const DonationCenterCard({
    super.key,
    required this.donationCenter,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DonationScreen.routeName,
          arguments: donationCenter,
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Global.lightGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Global.green, width: 2.0),
                  ),
                  child: CircleAvatar(
                    radius: 36,
                    backgroundColor: Global.white,
                    child: Image.asset("assets/donation_center.png"),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          donationCenter.name.length > 20
                              ? "${donationCenter.name.substring(0, 20)}..."
                              : donationCenter.name,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Global.darkGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "@${donationCenter.username}",
                        style: const TextStyle(
                          color: Global.mediumGrey,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Divider(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          donationCenter.description.length < 50
                              ? donationCenter.description
                              : "${donationCenter.description.substring(0, 50)}...",
                          style: const TextStyle(
                            color: Global.mediumGrey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
