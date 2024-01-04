import 'package:e_commerce_demo_flutter/screens/add_product.dart';
import 'package:e_commerce_demo_flutter/screens/dashboard.dart';
import 'package:e_commerce_demo_flutter/screens/profile.dart';
import 'package:e_commerce_demo_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final List<Map> tiles = [
    {
      "title": const Text("Settings"),
      "subtitle": const Text("Configure your app"),
      "icon": const Icon(Icons.settings),
      "trailing": null
    },
    {
      "title": const Text("Dark mode"),
      "subtitle": const Text("Toggle dark mode"),
      "icon": const Icon(Icons.dark_mode),
      "trailing": Switch(
        onChanged: (value) {},
        value: false,
      )
    },
  ];
  final List<Widget> _pages = [
    const Dashboard(),
    const AddProduct(),
    const Profile(),
  ];

  final List<Widget> _titles = [
    const Text("Ma-rket"),
    const Text("Upload product"),
    const Text("Profile"),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey,
      appBar: AppBar(
        title: _titles.elementAt(_selectedIndex),
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: tiles.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height * .18,
                child: const DrawerHeader(
                  child: ListTile(
                    leading: CircleAvatar(),
                    title: Text("Yared Fekade"),
                    subtitle: Text("Jaredyared83@gmail.com"),
                  ),
                ),
              );
            } else {
              return ListTile(
                title: tiles[index - 1]["title"],
                subtitle: tiles[index - 1]["subtitle"],
                leading: tiles[index - 1]["icon"],
                trailing: tiles[index - 1]["trailing"],
              );
            }
          },
        ),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
