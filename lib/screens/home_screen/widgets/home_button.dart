import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const HomeButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
