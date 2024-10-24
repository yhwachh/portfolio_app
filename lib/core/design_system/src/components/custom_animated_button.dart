import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isSelected; // Ajout d'une propriété pour savoir si le bouton est sélectionné

  CustomAnimatedButton({super.key, required this.label, this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? Colors.black : Colors.transparent, // Soulignement bleu si sélectionné
              width: 3.0, // Épaisseur du soulignement
            ),
          ),
        ),
        child: Opacity(
          opacity: isSelected ? 1.0 : 0.3, // 1.0 si sélectionné, sinon 0.3
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.black.withOpacity(0.7), // Texte noir ou légèrement transparent
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
