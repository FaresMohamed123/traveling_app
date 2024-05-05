// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';

class TripDetailScreen extends StatelessWidget {
  const TripDetailScreen({super.key});
  static const String screenRoute = 'tripDetailScreen';
  Widget buildSectionTitle(String titleText) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: const TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 31),
      ),
    );
  }

  Widget buildListViewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey)),
      height: 200,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripid = ModalRoute.of(context)!.settings.arguments as String;
    final selectTrip = Trips_data.firstWhere((Trip) => Trip.id == tripid);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectTrip.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('الانشطة'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectTrip.activities.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0.3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(selectTrip.activities[index]),
                    ),
                  );
                },
              ),
            ),
            buildSectionTitle('البرنامج اليومى'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectTrip.program.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(selectTrip.program[index]),
                        leading: CircleAvatar(
                          child: Text('يوم ${index + 1}'),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop(tripid);
          },
          child: const Icon(
            Icons.delete,
            color: Colors.amber,
          )),
    );
  }
}
