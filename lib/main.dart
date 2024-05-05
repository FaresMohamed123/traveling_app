// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:traveling_app/screen/filters_screen.dart';
import 'package:traveling_app/screen/tabs_screen.dart';
import 'screen/categories_trips_screen.dart';
import 'screen/trip_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // English
        Locale('ar', 'AE'), // Hebrew
      ],
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const TabsScreen(),
      routes: {
        TabsScreen.screenRoute:(context) => const TabsScreen(),
        CategoryTripScreen.screenRoute: (context) => CategoryTripScreen(),
        TripDetailScreen.screenRoute: (context) => const TripDetailScreen(),
        FiltersScreen.screenRoute :(context) =>  const FiltersScreen(),
      },
    );
  }
}
