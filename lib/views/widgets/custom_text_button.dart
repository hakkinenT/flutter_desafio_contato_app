import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      backgroundColor:
          MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    );

    const textStyle = TextStyle(
      fontSize: 16,
    );

    return SizedBox(
      width: double.maxFinite,
      height: 48,
      child: TextButton(
          style: style,
          onPressed: onPressed,
          child: Text(
            label,
            style: textStyle,
          )),
    );
  }
}
