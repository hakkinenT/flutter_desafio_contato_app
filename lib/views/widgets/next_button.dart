import 'package:flutter/material.dart';
import 'package:flutter_desafio_contato_app/views/widgets/directional_button_label.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: const NextLabel());
  }
}

class NextLabel extends StatelessWidget {
  const NextLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DirectionalButtonLabel(
      label: 'Próximo',
      mainAxisAlignment: MainAxisAlignment.end,
    );
  }
}
