import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  String? label;
  String? hint;
  String? msgError;
  int? inputType;
  int? lenght;
  IconData? icono;
  var controlador;
  bool error = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextFieldWidget(
      {super.key,
      this.label,
      this.hint,
      this.msgError,
      this.inputType,
      this.lenght,
      this.icono});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            inputFormatters: [LengthLimitingTextInputFormatter(widget.lenght)],
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.purple),
                    borderRadius: BorderRadius.circular(20)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(20)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(20)),
                prefixIcon: Container(
                  margin: const EdgeInsets.only(left: 14, right: 14),
                  child: Icon(
                    widget.icono,
                    color: Colors.white,
                  ),
                ),
                hintStyle: const TextStyle(color: Colors.white),
                labelStyle: const TextStyle(color: Colors.white),
                hintText: widget.hint,
                labelText: widget.label),
            keyboardType: widget.inputType == 0
                ? TextInputType.number
                : TextInputType.text,
            textInputAction: TextInputAction.next,
            onSaved: (value) {
              widget.controlador = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Fill in this field";
              } else if (widget.error) {
                return widget.msgError;
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              setState(() {
                widget.controlador = value;
                widget.error = false;
              });
            },
          ),
        ));
  }
}
