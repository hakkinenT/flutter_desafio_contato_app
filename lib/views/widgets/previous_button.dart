import 'package:flutter/material.dart';

import 'directional_button_label.dart';

class PreviousButton extends StatelessWidget {
  const PreviousButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: const PreviousLabel());
  }
}

class PreviousLabel extends StatelessWidget {
  const PreviousLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DirectionalButtonLabel(
      label: 'Voltar',
      mainAxisAlignment: MainAxisAlignment.start,
      arrowDirection: ArrowDirection.back,
    );
  }
}
