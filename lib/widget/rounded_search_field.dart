import 'package:flutter/material.dart';
import 'package:ergo_delivery/widget/text_field.dart';
import 'package:ergo_delivery/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        decoration: InputDecoration(
          hintText: "Procurar",
          icon: SvgPicture.asset('assets/icons/search.svg'),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
