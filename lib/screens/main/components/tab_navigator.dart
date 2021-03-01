import 'package:avid_frontend/screens/main/clubs/clubs_screen.dart';
import 'package:avid_frontend/screens/main/feed/feed_screen.dart';
import 'package:avid_frontend/screens/main/notifications/notifications_screen.dart';
import 'package:avid_frontend/screens/main/profile/profile_screen.dart';
import 'package:avid_frontend/screens/main/search/search_screen.dart';
import 'package:flutter/material.dart';

// class TabNavigatorRoutes {
//   static const String root = '/';
//   static const String detail = '/detail';
// }

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (tabItem) {
      case "Feed":
        child = FeedScreen();
        break;
      case "Clubs":
        child = ClubsScreen();
        break;
      case "Search":
        child = SearchScreen();
        break;
      case "Notifications":
        child = NotificationsScreen();
        break;
      case "Profile":
        child = ProfileScreen();
        break;
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
