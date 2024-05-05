// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:traveling_app/screen/categories_screen.dart';

import 'favorites_screen.dart';

// class TabsScreen extends StatelessWidget {
//   const TabsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.menu,
//                 color: Colors.white,
//               )),
//           title: const Text(
//             'دليل سياحى',
//             style: TextStyle(color: Colors.white),
//           ),
//           centerTitle: true,
//           bottom: const TabBar(
//               unselectedLabelColor: Colors.black54,
//               labelColor: Colors.amber,
//               tabs: [
//                 Tab(
//                   icon: Icon(Icons.dashboard),
//                   text: 'التصنيفات',
//                 ),
//                 Tab(
//                   text: 'المفضلة',
//                   icon: Icon(
//                     Icons.star,
//                   ),
//                 )
//               ]),
//         ),
//         body: const TabBarView(children: [
//           categoriesScreen(),
//           Favorites(),
//         ]),
//       ),
//     );
//   }
// }

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const String screenRoute = '/tabsScreen';
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScrren(int index) {
    setState(() {
      _selectedScreenindex = index;
    });
  }

  int _selectedScreenindex = 0;
  final List<Widget> _screens = [
    const categoriesScreen(),
    const Favorites(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedScreenindex,
          backgroundColor: Colors.cyan,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black54,
          onTap: _selectScrren,
          items: const [
            BottomNavigationBarItem(
              label: 'التصنيفات',
              icon: Icon(
                Icons.dashboard,
              ),
            ),
            BottomNavigationBarItem(
              label: 'المفضلة',
              icon: Icon(
                Icons.star,
              ),
            )
          ]),
      body: _screens[_selectedScreenindex],
    );
  }
}
