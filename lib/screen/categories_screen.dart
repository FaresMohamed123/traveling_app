// ignore_for_file: camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/app_drawer.dart';
import 'package:traveling_app/widgets/category_item.dart';

import '../app_data.dart';

class categoriesScreen extends StatelessWidget {
  const categoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('دليل سياحى',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: Categories_data.map((categoriesData) =>
            CategoryItem(title: categoriesData.title, imageUrl: categoriesData.imageUrl,id: categoriesData.id,)).toList(),
      ),
    );
  }
}
