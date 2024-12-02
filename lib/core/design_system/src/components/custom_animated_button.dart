import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/core/design_system/app_ui.dart';

class CustomAnimatedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool
      isSelected; // Ajout d'une propriété pour savoir si le bouton est sélectionné

  CustomAnimatedButton(
      {super.key, required this.label, this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? theme.colors.textColor : Colors.transparent,
              width: 3.0, // Épaisseur du soulignement
            ),
          ),
        ),
        child: Text(
          label,
          style:  GoogleFonts.montserrat(
            color: theme.colors.textColor.withOpacity(isSelected ? 1 : 0.3),
            // Texte noir ou légèrement transparent
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
