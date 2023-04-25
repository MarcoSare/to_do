import 'package:flutter/material.dart';

class DownListGender extends StatefulWidget {
  DownListGender({super.key});
  String? control = "male";

  @override
  State<DownListGender> createState() => _DownListGenderState();
}

class _DownListGenderState extends State<DownListGender> {
  List<String> genders = ["male", "female", "Other"];
  String dropDownValue = "male";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        value: dropDownValue,
        dropdownColor: Colors.white70,
        icon: const Icon(Icons.expand_more),
        decoration: InputDecoration(
            prefixIcon: Container(
              margin: const EdgeInsets.only(left: 14, right: 14),
              child: Icon(
                Icons.man,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            hintText: "Gender",
            labelText: "Gender"),
        items: genders.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
                style: TextStyle(color: Theme.of(context).primaryColorLight)),
          );
        }).toList(),
        onChanged: (String? newValue) {
          dropDownValue = newValue!;
          widget.control = newValue;
        },
      ),
    );
  }
}
