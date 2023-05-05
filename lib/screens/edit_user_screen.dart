import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do/models/user_model.dart';
import 'package:to_do/network/api_user.dart';
import 'package:to_do/widgets/down_list_gender.dart';
import 'package:to_do/widgets/pass_field.dart';
import 'package:to_do/widgets/text_field.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  ApiUser apiUser = ApiUser();
  final ImagePicker _picker = ImagePicker();
  var image_selected;
  late UserModel? userModel;
  late TextFieldWidget firstName;
  late TextFieldWidget lastName;
  PassField passField = PassField(label: "New password", hint: "New password");
  late DownListGender downListGender;
  PassField confirmPassField = PassField(
      label: "Confirm password",
      hint: "Confirm password",
      msgError: "Password wrong");

  Future<UserModel?> getUser() async {
    userModel = await apiUser.getUser();
    initGui(userModel);
    return userModel;
  }

  void initGui(UserModel? user) {
    downListGender = DownListGender(
      control: getGender(user!.gender),
    );
    firstName = TextFieldWidget(
      label: "First name",
      hint: "First name",
      msgError: "",
      inputType: 1,
      lenght: 50,
      icono: Icons.account_circle,
      controlador: user.firstName,
    );

    lastName = TextFieldWidget(
      label: "Last name",
      hint: "Last name",
      msgError: "",
      inputType: 1,
      lenght: 50,
      icono: Icons.account_circle,
      controlador: user.lastName,
    );
  }

  String getGender(String? prefixGender) {
    if (prefixGender == "m") return "male";
    if (prefixGender == "f") {
      return "female";
    } else {
      return "other";
    }
  }

  Future<void> seleFromGalery() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        image_selected = File(image.path);
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder(
          future: getUser(),
          builder: (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 150,
                          width: 150,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              snapshot.data!.profilePicture!,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(
                                Icons.add_a_photo,
                                color: Colors.black,
                                size: 30,
                              ),
                              onPressed: () async {
                                await seleFromGalery();
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    firstName,
                    lastName,
                    passField,
                    downListGender,
                    confirmPassField,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () async {
                                ApiUser apiUser = ApiUser();
                                UserModel? user = await apiUser.getUser();
                                print(user!.firstName);
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 15, left: 15),
                                child: Text("Acept"),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(right: 15, left: 15),
                                child: Text("Cancel"),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              );
            } else {
              if (snapshot.error != null) {
                return const Text("Error");
              } else {
                return const Text("Cargando ...");
              }
            }
          }),
    ));
  }
}
/*
Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://images-ext-2.discordapp.net/external/fi1_h4sOURr3o4U437NbG0jSfyvUCTx3VCAoZJx6090/https/xsgames.co/randomusers/assets/avatars/male/74.jpg",
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
            firstName,
            lastName,
            passField,
            downListGender,
            confirmPassField,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        ApiUser apiUser = ApiUser();
                        UserModel? user = await apiUser.getUser();
                        print(user!.firstName);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 15, left: 15),
                        child: Text("Acept"),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.only(right: 15, left: 15),
                        child: Text("Cancel"),
                      )),
                )
              ],
            )
          ],
        ),
      ),
*/