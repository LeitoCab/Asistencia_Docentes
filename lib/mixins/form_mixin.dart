import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

mixin FormMixin<T extends StatefulWidget> on State<T> {
  TextInputFormatter withoutSpaces =
      FilteringTextInputFormatter.deny(RegExp(r'[\s\n]'));
  String? emailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese su email';
    }
    if (!RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
    ).hasMatch(value)) {
      return 'Ingrese un email válido';
    }
    return null;
  }
}
