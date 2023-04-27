import 'package:flutter/material.dart';
import 'package:need2give/models/donation_center.dart';
import 'package:need2give/models/item.dart';
import 'package:need2give/models/user.dart';
import 'package:need2give/screens/auth/login.dart';
import 'package:need2give/screens/auth/signup.dart';
import 'package:need2give/screens/auth/welcome.dart';
import 'package:need2give/screens/donation_center/add_item.dart';
import 'package:need2give/screens/donation_center/dashboard.dart';
import 'package:need2give/screens/donation_center/update_item.dart';
import 'package:need2give/screens/donation_center/view_items.dart';
import 'package:need2give/screens/user/donation_profile.dart';
import 'package:need2give/screens/user/home.dart';
import 'package:need2give/screens/user/item.dart';
import 'package:need2give/screens/user/search.dart';
import 'package:need2give/screens/user/map.dart';
import 'package:need2give/screens/user/category.dart';
import 'package:need2give/screens/user/bottom_bar.dart' as user;
import 'package:need2give/screens/donation_center/bottom_bar.dart' as dc;
import 'package:need2give/screens/donation_center/edit_profile.dart' as edit_dc;
import 'package:need2give/screens/user/edit_profile.dart' as edit_user;
import 'package:need2give/screens/user/search_results.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case WelcomeScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const WelcomeScreen(),
      );
    case Login.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const Login(),
      );
    case SignUp.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const SignUp(),
      );
    case Home.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const Home(),
      );
    case Search.routeName:
      var args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => Search(
          searchMode: args["mode"],
          params: args["params"],
        ),
      );
    case MapScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const MapScreen(),
      );
    case user.ButtonNavbar.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const user.ButtonNavbar(),
      );
    case dc.ButtonNavbar.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const dc.ButtonNavbar(),
      );
    case Category.routeName:
      var category = settings.arguments as String;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => Category(category: category),
      );
    case ItemPage.routeName:
      var args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => ItemPage(
          item: args["item"],
          editable: args["editable"],
        ),
      );
    case UpdateItem.routeName:
      var item = settings.arguments as Item;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => UpdateItem(item: item),
      );
    case ViewAllItems.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const ViewAllItems(),
      );
    case Dashboard.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const Dashboard(),
      );
    case AddItem.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const AddItem(),
      );
    case DonationScreen.routeName:
      var id = settings.arguments as int;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => DonationScreen(id: id),
      );
    case edit_dc.EditProfile.routeName:
      var donationCenter = settings.arguments as DonationCenter;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => edit_dc.EditProfile(donationCenter: donationCenter),
      );
    case edit_user.EditProfile.routeName:
      var user = settings.arguments as User;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => edit_user.EditProfile(user: user),
      );
    case SearchResult.routeName:
      var args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => SearchResult(
          searchStr: args["searchStr"],
          searchMode: args["searchMode"],
        ),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('page doesnt exist'),
          ),
        ),
      );
  }
}
