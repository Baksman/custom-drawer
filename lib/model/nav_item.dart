import 'package:flutter/material.dart';

class NavItem {
  final String title;
  final IconData icon;

  NavItem({this.title, this.icon});
}

List<NavItem> navItem = [
  NavItem(title: "Dashboard", icon: Icons.insert_chart),
  NavItem(title: "Errors", icon: Icons.error),
  NavItem(title: "Search", icon: Icons.search),
  NavItem(title: "Navigation", icon: Icons.notifications),
  NavItem(title: "Settings", icon: Icons.settings)
];
