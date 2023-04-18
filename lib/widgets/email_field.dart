import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailField extends StatefulWidget {
  String? label;
  String? hint;
  String? msgError;
  var controlador;
  bool error = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  EmailField({super.key, this.label, this.hint, this.msgError});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
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
                  child: const Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                ),
                hintStyle: const TextStyle(color: Colors.white),
                labelStyle: const TextStyle(color: Colors.white),
                hintText: widget.hint,
                labelText: widget.label),
            keyboardType: TextInputType.emailAddress,
            autofillHints: [AutofillHints.email],
            textInputAction: TextInputAction.next,
            onSaved: (value) {
              widget.controlador = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter an email";
              } else if (!EmailValidator.validate(value)) {
                return "Enter email valited";
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
