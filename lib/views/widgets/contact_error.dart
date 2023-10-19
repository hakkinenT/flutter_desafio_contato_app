import 'package:flutter/material.dart';

class ContactError extends StatelessWidget {
  const ContactError({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
