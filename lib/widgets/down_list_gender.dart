import 'package:flutter/material.dart';

class DownListGender extends StatefulWidget {
  DownListGender({super.key, required this.control});
  String control;

  @override
  State<DownListGender> createState() => _DownListGenderState();
}

class _DownListGenderState extends State<DownListGender> {
  @override
  initState() {
    dropDownValue = widget.control;
  }

  List<String> genders = ["male", "female", "other"];
  late String dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        value: dropDownValue,
        dropdownColor: Theme.of(context).colorScheme.background,
        icon: const Icon(Icons.expand_more),
        decoration: InputDecoration(
            prefixIcon: Container(
              margin: const EdgeInsets.only(left: 14, right: 14),
              child: const Icon(
                Icons.man,
              ),
            ),
            hintText: "Gender",
            labelText: "Gender"),
        items: genders.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
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
