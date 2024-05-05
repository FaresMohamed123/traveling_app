import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: const AppDrawer(),
       appBar: AppBar(
        title: const Text('الرحلات المفضلة',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
    );
  }
}