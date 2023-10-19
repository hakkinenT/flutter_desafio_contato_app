import 'package:flutter/material.dart';

class ContactLoadingProgress extends StatelessWidget {
  const ContactLoadingProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
