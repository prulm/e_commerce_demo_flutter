import 'dart:io';

import 'package:e_commerce_demo_flutter/utils/constants.dart';
import 'package:e_commerce_demo_flutter/widgets/rounded_button.dart';
import 'package:e_commerce_demo_flutter/widgets/rounded_input.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
          horizontal: MediaQuery.sizeOf(context).width * .08,
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
                    bottom: 0,
                    right: MediaQuery.of(context).size.width * .23,
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
              SizedBox(
                height: 15,
              ),
              RoundedInput(
                iconSuffix: null,
                label: "First name",
                textObsecured: false,
                inputController: fNameController,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .02),
              RoundedInput(
                iconSuffix: null,
                label: "Last name",
                textObsecured: false,
                inputController: lNameController,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .02),
              RoundedInput(
                iconSuffix: null,
                label: "Email",
                textObsecured: false,
                inputController: emailController,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .02),
              RoundedInput(
                iconSuffix: Container(
                  padding: EdgeInsets.only(
                    right: MediaQuery.sizeOf(context).width * .03,
                  ),
                  child: IconButton(
                    icon: Icon(
                        isVisible ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() => isVisible = !isVisible);
                    },
                  ),
                ),
                label: "Password",
                textObsecured: !isVisible,
                inputController: passwordController,
              ),
              SizedBox(
                height: 15,
              ),
              RoundedButton(
                text: "Save Changes",
                heightFactor: .06,
                widthFactor: .3,
                buttonPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
