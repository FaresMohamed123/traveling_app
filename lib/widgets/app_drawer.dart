import 'package:flutter/material.dart';
import 'package:traveling_app/screen/filters_screen.dart';

import '../screen/tabs_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50),
            width: double.infinity,
            height: 150,
            decoration: const BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const Text(
              'دليلك السياحى',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(TabsScreen.screenRoute);
            },
            child: ListTile(
              title: Text('الرحلات',
                  style: Theme.of(context).textTheme.titleLarge),
              leading:
                  const Icon(Icons.card_travel, color: Colors.blue, size: 35),
            ),
          ),
          const Divider(),
          MaterialButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.screenRoute);
            },
            child: ListTile(
              title: Text('الفلترة',
                  style: Theme.of(context).textTheme.titleLarge),
              leading:
                  const Icon(Icons.filter_list, color: Colors.blue, size: 35),
            ),
          ),
        ],
      ),
    ));
  }
}
