import 'package:flutter/material.dart';

class LuxInput extends StatelessWidget {
  final String placeholder;
  final String label;
  final EdgeInsetsGeometry margin;
  final String errorText;
  final Function validator;
  final TextEditingController controller;
  final bool obscureText;
  final String initialValue;
  final bool autovalidate;
  final TextInputType keyboardType;

  LuxInput({
    this.placeholder,
    this.label,
    this.margin,
    this.errorText,
    this.validator,
    this.controller,
    this.obscureText,
    this.initialValue,
    this.autovalidate = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        autofocus: false,
        autocorrect: false,
        autovalidate: autovalidate,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          errorText: errorText,
          focusedBorder: OutlineInputBorder(),
          hintText: placeholder,
          labelText: label,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(12),
          filled: true,
          fillColor: Theme.of(context).primaryColorLight,
        ),
        validator: validator,
        controller: controller,
        obscureText: obscureText ?? false,
        keyboardAppearance: Brightness.dark,
        initialValue: initialValue,
        keyboardType: keyboardType,
      ),
    );
  }
}
