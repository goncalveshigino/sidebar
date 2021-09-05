import 'package:flutter/material.dart';
import 'package:silebar/menu_dashboard.dart';
import 'package:silebar/pages/home_page.dart';
import 'package:silebar/pages/settings_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute:  MenuDashboardPage.routeName,
      routes: {
        MenuDashboardPage.routeName: (BuildContext context) => MenuDashboardPage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}