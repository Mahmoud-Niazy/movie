import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget{
  const CircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7,
      height: 7,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}