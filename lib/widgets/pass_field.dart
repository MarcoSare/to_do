import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PassField extends StatefulWidget {
  String? label;
  String? hint;
  String? msgError;
  var controlador;
  bool error = false;
  bool isShow = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  PassField({super.key, this.label, this.hint, this.msgError});

  @override
  State<PassField> createState() => _PassFieldState();
}

class _PassFieldState extends State<PassField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          obscureText: !widget.isShow,
          inputFormatters: [LengthLimitingTextInputFormatter(50)],
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          decoration: InputDecoration(
              prefixIcon: Container(
                margin: const EdgeInsets.only(left: 14, right: 14),
                child: Icon(
                  Icons.lock,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              suffixIcon: Container(
                margin: const EdgeInsets.only(left: 14, right: 14),
                child: IconButton(
                  icon: Icon(
                    widget.isShow ? Icons.visibility : Icons.visibility_off,
                    color: widget.isShow
                        ? Colors.purple
                        : Theme.of(context).primaryColorLight,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.isShow = !widget.isShow;
                    });
                  },
                ),
              ),
              hintText: widget.hint,
              labelText: widget.label),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          onSaved: (value) {
            widget.controlador = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter your password";
            } else if (widget.error) {
              return widget.msgError;
            }
          },
          onChanged: (value) {
            widget.controlador = value;
            widget.error = false;
          },
        ),
      ),
    );
  }
}
