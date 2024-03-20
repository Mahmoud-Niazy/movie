import 'package:flutter/material.dart';

showSnackBar({
  required BuildContext context,
  required String label,
  required Color color ,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
    ),
  );
}