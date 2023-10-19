import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.preffixIcon,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.readOnly = false,
  });

  final TextEditingController? controller;
  final String hintText;
  final Widget? preffixIcon;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      readOnly: readOnly,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black26,
        ),
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
