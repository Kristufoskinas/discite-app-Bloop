import 'package:bloop/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedConfirmField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedConfirmField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Repeat Password",
        border: InputBorder.none,
      ),
    ));
  }
}
