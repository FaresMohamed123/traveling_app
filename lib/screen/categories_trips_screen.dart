// ignore_for_file: unused_local_variable, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/widgets/trip_item.dart';

class CategoryTripScreen extends StatelessWidget {
  static const screenRoute = 'categoryTripScreen';
  @override
  Widget build(BuildContext context) {
    final routArgments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catogaryId = routArgments['id'];
    final catogaryTitle = routArgments['title'];
     final filteredTrips = Trips_data.where((Trip){
      return Trip.categories.contains(catogaryId);
     }).toList();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            catogaryTitle!,
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
           itemCount: filteredTrips.length,
          itemBuilder: (context, index) {
            return  TripItem(
              id: filteredTrips[index].id,
              title: filteredTrips[index].title,
              duration:filteredTrips[index].duration ,
              imageUrl:filteredTrips[index].imageUrl ,
              season:filteredTrips[index].season ,
              tripType:filteredTrips[index].tripType ,
            ) ;
          },
         
        ));
  }
}
