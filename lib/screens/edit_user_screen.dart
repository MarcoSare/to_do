import 'package:flutter/material.dart';
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
  TextFieldWidget firstName = TextFieldWidget(
    label: "First name",
    hint: "First name",
    msgError: "",
    inputType: 1,
    lenght: 50,
    icono: Icons.account_circle,
  );
  TextFieldWidget lastName = TextFieldWidget(
    label: "Last name",
    hint: "Last name",
    msgError: "",
    inputType: 1,
    lenght: 50,
    icono: Icons.account_circle,
  );
  PassField passField = PassField(label: "New password", hint: "New password");
  DownListGender downListGender = DownListGender();
  PassField confirmPassField = PassField(
      label: "Confirm password",
      hint: "Confirm password",
      msgError: "Password wrong");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                        var response = await apiUser.getUser();
                        print(response);
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
    );
  }
}
