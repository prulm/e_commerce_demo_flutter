import 'dart:io';

import 'package:e_commerce_demo_flutter/utils/constants.dart';
import 'package:e_commerce_demo_flutter/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  bool isVisible = false;
  Color themeColor = Color.fromARGB(255, 47, 206, 238);

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

  void showDiaglogue(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * .1,
          vertical: MediaQuery.sizeOf(context).height * .02,
        ),
        child: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * .2,
                    backgroundImage:
                        (image != null) ? FileImage(File(image!.path)) : null,
                    child: (image == null)
                        ? Image.network(
                            "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png")
                        : null,
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * .007,
                    right: MediaQuery.of(context).size.width * .25,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          showDiaglogue(context);
                        },
                        highlightColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 25, top: 5),
                child: Text(
                  "Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                height: 35,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    )),
                    hintText: 'Your name here...',
                    contentPadding: EdgeInsets.only(left: 10),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 25, top: 5),
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                height: 35,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    )),
                    hintText: 'example@gmail.com',
                    contentPadding: EdgeInsets.only(left: 10),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 25, top: 5),
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                height: 35,
                child: TextField(
                  obscureText: !isVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    )),
                    hintText: 'Enter a password',
                    contentPadding: EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      icon: Icon(
                          isVisible ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() => isVisible = !isVisible);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              RoundedButton(
                text: "Save Changes",
                heightFactor: .053,
                widthFactor: .4,
                buttonPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
