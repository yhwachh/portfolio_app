import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  const CustomAnimatedButton({super.key, required this.label, this.onTap});

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        duration: const Duration(seconds: 2),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: Text(widget.label),
      ),
    );
  }
}
