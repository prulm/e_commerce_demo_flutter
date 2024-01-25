import 'package:e_commerce_demo_flutter/models/product.dart';
import 'package:e_commerce_demo_flutter/models/user.dart';
import 'package:e_commerce_demo_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
      description: "A red toyota yaris. serious inquiries only.",
      dateUploaded: "10/12/23",
      pictures: ["pictures"],
    ),
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
      description: "A red toyota yaris. serious inquiries only.",
      dateUploaded: "10/12/23",
      pictures: ["pictures"],
    ),
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
      description: "A red toyota yaris. serious inquiries only.",
      dateUploaded: "10/12/23",
      pictures: ["pictures"],
    ),
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
      description: "A red toyota yaris. serious inquiries only.",
      dateUploaded: "10/12/23",
      pictures: ["pictures"],
    ),
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
      description: "A red toyota yaris. serious inquiries only.",
      dateUploaded: "10/12/23",
      pictures: ["pictures"],
    ),
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
      description: "A red toyota yaris. serious inquiries only.",
      dateUploaded: "10/12/23",
      pictures: ["pictures"],
    ),
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
      description: "A red toyota yaris. serious inquiries only.",
      dateUploaded: "10/12/23",
      pictures: ["pictures"],
    ),
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
      description: "A red toyota yaris. serious inquiries only.",
      dateUploaded: "10/12/23",
      pictures: ["pictures"],
    ),
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
      description: "A red toyota yaris. serious inquiries only.",
      dateUploaded: "10/12/23",
      pictures: ["pictures"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * .01,
              horizontal: MediaQuery.sizeOf(context).width * .03),
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
                  onPressed: () {},
                ),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * .7,
                child: MasonryGridView.count(
                  itemCount: products.length,
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      surfaceTintColor: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .25,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                              child: Image.asset('assets/images/auth_design.png', 
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ListTile(
                            title: Text(products[index].name),
                            subtitle: Text(products[index].dateUploaded),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
