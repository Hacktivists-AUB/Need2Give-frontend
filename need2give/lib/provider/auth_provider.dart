import 'package:need2give/models/donation_center.dart';
import 'package:need2give/models/profile.dart';
import 'package:need2give/models/user.dart';
import 'package:flutter/material.dart';
import 'package:need2give/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  Profile? _profile;

  Profile? get profile => _profile;

  void setAccount(String user, AccountType type) {
    switch (type) {
      case AccountType.donationCenter:
        _profile = DonationCenter.fromJson(user);
        break;
      case AccountType.user:
        _profile = User.fromJson(user);
        break;
      case AccountType.none:
        _profile = ProfileData.fromJson(user);
        break;
    }
    notifyListeners();
  }
}
