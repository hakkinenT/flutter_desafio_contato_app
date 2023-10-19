import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_text_form_field.dart';
import 'form_label.dart';

class ContactFormField extends StatelessWidget {
  const ContactFormField({
    super.key,
    this.controller,
    required this.label,
    required this.hintText,
    this.preffixIcon,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.readOnly = false,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final String label;
  final String hintText;
  final Widget? preffixIcon;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormLabel(
          label: label,
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          hintText: hintText,
          controller: controller,
          preffixIcon: preffixIcon,
          onChanged: onChanged,
          validator: validator,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          readOnly: readOnly,
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }
}
