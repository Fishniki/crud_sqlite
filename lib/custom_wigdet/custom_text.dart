import 'package:flutter/material.dart';

class PemasukanText extends StatelessWidget {
  const PemasukanText(this.text,{super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold
      ),
      );
  }
}

class PengeluaranText extends StatelessWidget {
  const PengeluaranText(this.text,{super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold
      ),
      );
  }
}
