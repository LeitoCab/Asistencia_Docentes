import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(width: 3.0, color: Color(0xFF3F4DC8)),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(0xFF2B1C4B),
        ),
        fixedSize: MaterialStateProperty.all<Size>(
          const Size(358, 62),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
