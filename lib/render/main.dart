import 'package:aparkado_interview/render/diagonal_list.dart';
import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: DiagonalList(
            children: List.generate(
              10,
              (index) => Square(Colors.blue[(index + 1) * 100]),
            ),
          ),
        ),
      ),
    );
  }
}

class Square extends StatelessWidget {
  final Color? color;

  const Square(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: color ?? Colors.black, height: 30);
  }
}
