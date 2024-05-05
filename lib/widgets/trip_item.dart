// ignore_for_file: deprecated_member_use, dead_code, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/screen/trip_detail_screen.dart';

class TripItem extends StatelessWidget {
  const TripItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.tripType,
    required this.season,
    required this.duration,
  });
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  void selectTrip(context) {
    Navigator.of(context).pushNamed(TripDetailScreen.screenRoute,arguments: id );
  }

  String get seasonText {
    switch (season) {
      case Season.Winter:
        return 'شتاء';
        break;
      case Season.Spring:
        return 'ربيع';
        break;
      case Season.Summer:
        return 'صيف';
        break;
      case Season.Autumn:
        return 'خريف';
        break;
      default:
        return 'غير معروف';
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Activities:
        return 'انشطة';
        break;
      case TripType.Exploration:
        return 'استكشاف';
        break;
      case TripType.Therapy:
        return 'معالجه';
        break;
      case TripType.Recovery:
        return 'انشطة';
        break;
      default:
        return 'غير معروف';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        elevation: 15,
        shadowColor: Colors.black,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(20)),
                  child: Container(
                    color: Colors.black.withOpacity(0.4),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: 250,
                      width: double.infinity,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  height: 250,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.8),
                        ],
                        stops: const [
                          0.6,
                          1,
                        ]),
                  ),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  newMethod(
                      const Icon(
                        Icons.today,
                        color: Colors.amber,
                      ),
                      '$durationأيام '),
                  newMethod(
                      const Icon(
                        Icons.sunny,
                        color: Colors.amber,
                      ),
                      seasonText),
                  newMethod(
                      const Icon(
                        Icons.family_restroom,
                        color: Colors.amber,
                      ),
                      tripTypeText),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row newMethod(Icon Icon, String title) {
    return Row(
      children: [
        Icon,
        const SizedBox(
          width: 5,
        ),
        Text(title),
      ],
    );
  }
}
