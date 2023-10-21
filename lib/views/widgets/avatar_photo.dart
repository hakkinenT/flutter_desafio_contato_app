import 'dart:io';

import 'package:flutter/material.dart';

class AvatarPhoto extends StatelessWidget {
  const AvatarPhoto({super.key, required this.fileName, required this.radius});

  final double radius;
  final String fileName;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: Image.file(File(fileName)).image,
    );
  }
}
