import 'package:flutter/material.dart';

class DirectionalButtonControllPanel extends StatelessWidget {
  const DirectionalButtonControllPanel({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }
}
