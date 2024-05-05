import 'package:flutter/material.dart';

import 'package:traveling_app/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String screenRoute = 'FiltersScreen';

  const FiltersScreen({super.key});
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isInSummer = false;
  var _isInWinter = false;
  var _isForFamilies = false;

  Widget buildSwitchListTile(String title, String supTitle, var currentValue,
      Function(bool)? updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(supTitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'الفلترة',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed:() {
            
          },  icon: const Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                'الرحلات الصيفية',
                'اظهار الرحلات فى فصل الصيف فقط',
                _isInSummer,
                (value) {
                  setState(() {
                    _isInSummer = value;
                  });
                },
              ),
              buildSwitchListTile(
                'الرحلات الشتوية',
                'اظهار الرحلات فى فصل الشتاء فقط',
                _isInWinter,
                (value) {
                  setState(() {
                    _isInWinter = value;
                  });
                },
              ),
              buildSwitchListTile(
                'الرحلات العائلية',
                'اظهار الرحلات فى فصل العائلية فقط',
                _isForFamilies,
                (value) {
                  setState(() {
                    _isForFamilies = value;
                  });
                },
              )
            ],
          ))
        ],
      ),
    );
  }
}
