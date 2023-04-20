import 'package:need2give/models/donation_center.dart';
import 'package:need2give/models/account.dart';
import 'package:need2give/models/user.dart';
import 'package:flutter/material.dart';
import 'package:need2give/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  Account _profile = Account(
    username: '',
    email: '',
    password: '',
  );

  Account get profile => _profile;

  void setAccount(String user, AccountType type) {
    switch (type) {
      case AccountType.donationCenter:
        _profile = DonationCenter.fromJson(user);
        break;
      case AccountType.user:
        _profile = User.fromJson(user);
        break;
      case AccountType.none:
        break;
    }
    notifyListeners();
  }
}
