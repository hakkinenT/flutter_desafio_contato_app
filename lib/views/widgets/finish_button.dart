import 'package:flutter/material.dart';

class FinishButton extends StatelessWidget {
  const FinishButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: const FinishLabel());
  }
}

class FinishLabel extends StatelessWidget {
  const FinishLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Finalizar',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(Icons.check),
      ],
    );
  }
}
