import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget {
  const EditTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.onChanged,
    this.validator,
    required this.labeltext,
  }) : super(key: key);

  final String hintText;
  final IconData icon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String labeltext;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labeltext,
        prefixIcon: Icon(icon),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF2B1C4B), width: 3.0)),
      ),
    );
  }
}
