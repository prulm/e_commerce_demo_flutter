import 'dart:convert';

import 'package:e_commerce_demo_flutter/utils/constants.dart';
import 'package:e_commerce_demo_flutter/widgets/rounded_button.dart';
import 'package:e_commerce_demo_flutter/widgets/rounded_input.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productBrandController = TextEditingController();
  final TextEditingController productColorController = TextEditingController();
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

  Future<void> galleryImage(BuildContext context) async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
    Navigator.pop(context);
  }

  Future<void> cameraImage(BuildContext context) async {
    image = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
    Navigator.pop(context);
  }

  void showDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Select Image Source"),
        content: Container(
          height: MediaQuery.of(context).size.height * .2,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("Camera"),
                onTap: () {
                  cameraImage(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text("Gallery"),
                onTap: () {
                  galleryImage(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _uploadProduct(
      String name, String brand, String price, String color) async {
    final url = Uri.parse("$apiUrl/product/add.php");
    debugPrint(url.toString());
    final request = http.MultipartRequest("POST", url);
    debugPrint("sent");
    request.files.add(
      await http.MultipartFile.fromPath('image', image!.path),
    );

    request.fields["name"] = name;
    request.fields["brand"] = brand;
    request.fields["price"] = price;
    request.fields["color"] = color;

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      try {
        final Map<String, dynamic> data = json.decode(responseBody);

        if (data['success'] != null && data['success']) {
          debugPrint('Product Registered successful');
        } else {
          debugPrint('Product Registration Failed');
        }
      } catch (e) {
        debugPrint('Error decoding JSON: $e');
      }
    } else {
      debugPrint('Empty response body');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey,
      appBar: AppBar(
        title: const Text("Upload a product"),
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
              vertical: MediaQuery.sizeOf(context).height * .03,
              horizontal: MediaQuery.sizeOf(context).height * .03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundedInput(
                iconSuffix: null,
                label: "Product name",
                textObsecured: false,
                inputController: productNameController,
              ),
              RoundedInput(
                iconSuffix: null,
                label: "Product brand",
                textObsecured: false,
                inputController: productBrandController,
              ),
              RoundedInput(
                iconSuffix: null,
                label: "Color",
                textObsecured: false,
                inputController: productColorController,
              ),
              RoundedInput(
                iconSuffix: null,
                label: "Price",
                textObsecured: false,
                inputController: productPriceController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.add),
                    onPressed: () => showDialogue(context),
                    label: Text("Add product images"),
                  ),
                  RoundedButton(
                    text: "Upload",
                    heightFactor: .053,
                    widthFactor: .5,
                    buttonPressed: () => _uploadProduct(
                        productNameController.text,
                        productBrandController.text,
                        productPriceController.text,
                        productColorController.text),
                  ),
                ],
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
