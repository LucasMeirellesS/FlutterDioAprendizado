import 'package:flutter/material.dart';

class TextLabel2 extends StatelessWidget {
  final String texto;
  const TextLabel2({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
