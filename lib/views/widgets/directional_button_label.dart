import 'package:flutter/material.dart';

enum ArrowDirection { back, forward }

class DirectionalButtonLabel extends StatelessWidget {
  const DirectionalButtonLabel({
    super.key,
    required this.label,
    this.arrowDirection = ArrowDirection.forward,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final String label;
  final ArrowDirection arrowDirection;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        if (arrowDirection == ArrowDirection.back) ...[
          const Icon(Icons.arrow_back),
          const SizedBox(
            width: 5,
          ),
        ],
        Text(
          label,
          style: const TextStyle(fontSize: 18),
        ),
        if (arrowDirection == ArrowDirection.forward) ...[
          const SizedBox(
            width: 5,
          ),
          const Icon(Icons.arrow_forward),
        ]
      ],
    );
  }
}
