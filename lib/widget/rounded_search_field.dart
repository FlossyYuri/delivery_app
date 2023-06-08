import 'package:flutter/material.dart';
import 'package:delivery_app/widget/text_field.dart';
import 'package:delivery_app/constants.dart';

class RoundedSearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedSearchField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: false,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: const InputDecoration(
          hintText: "Procurar",
          icon: Icon(
            Icons.search,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
