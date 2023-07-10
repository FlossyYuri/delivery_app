import 'package:flutter/material.dart';

class CustomTextInput extends StatefulWidget {
  final Function(String, dynamic) setFieldValue;
  final String name;
  final String label;
  final String placeholder;

  const CustomTextInput({
    super.key,
    required this.setFieldValue,
    required this.name,
    required this.label,
    this.placeholder = '',
  });

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.grey.shade500,
              ),
        ),
        TextFormField(
          style: TextStyle(color: Colors.grey.shade800),
          cursorColor: Theme.of(context).secondaryHeaderColor,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .apply(color: Colors.grey.shade400),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            alignLabelWithHint: false,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: Theme.of(context).secondaryHeaderColor, width: 1)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).secondaryHeaderColor,
                width: 1,
              ),
            ),
          ),
          validator: (String? value) {
            if (value!.isEmpty) {
              return "${widget.label} is Required";
            }
            if (value.length < 5) {
              return "Invalid ${widget.label} size";
            }
            return null;
          },
          onSaved: (String? value) {
            widget.setFieldValue(widget.name, value!);
          },
        ),
      ],
    );
  }
}
