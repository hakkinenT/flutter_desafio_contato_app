import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyContact extends StatelessWidget {
  const EmptyContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _EmptyContactBody(
      children: [
        Lottie.asset('assets/images/contact.json',
            width: 380, height: 250, fit: BoxFit.fitWidth),
        const _EmptyContactMessageTitle(),
        const SizedBox(
          height: 10,
        ),
        const _EmptyContactMessageContent(),
      ],
    );
  }
}

class _EmptyContactBody extends StatelessWidget {
  const _EmptyContactBody({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dx = size.width / 2;
    final dy = size.height / 2;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Align(
        alignment: Alignment(dx, dy),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}

class _EmptyContactMessageContent extends StatelessWidget {
  const _EmptyContactMessageContent();

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
          text: 'Clique em',
          style: TextStyle(
            fontSize: 18,
          ),
          children: [
            TextSpan(
              text: ' + ',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'para começar',
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ]),
      textAlign: TextAlign.center,
    );
  }
}

class _EmptyContactMessageTitle extends StatelessWidget {
  const _EmptyContactMessageTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Ainda não há Contatos cadastrados.',
      style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.primary),
      textAlign: TextAlign.center,
    );
  }
}
