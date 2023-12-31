import 'package:e_commerce_demo_flutter/models/product.dart';
import 'package:e_commerce_demo_flutter/models/user.dart';
import 'package:e_commerce_demo_flutter/screens/add_product.dart';
import 'package:e_commerce_demo_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
  final List<Product> products = [
    Product(
      id: 1,
      name: "Toyota Yaris",
      seller: User(
        id: 1,
        firstName: "Yared",
        lastName: "Fekade",
        profilePicture: "profilePicture",
        email: "jaredyared83@gmail.com",
        phone: "0984872232",
      ),
      price: 1700000.00,
      color: "red",
      brand: "Toyota",
      pictures: ["pictures"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey,
      appBar: AppBar(
        title: const Text("ma-rket"),
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
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * .01,
              horizontal: MediaQuery.sizeOf(context).height * .03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  "Products",
                  style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).height * .04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.tune),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddProduct(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * .7,
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        title: Text(products[index].name),
                        subtitle: Text(products[index].brand),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
