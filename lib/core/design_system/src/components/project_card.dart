import 'package:flutter/material.dart';
import 'package:portfolio_app/core/design_system/app_ui.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String UrlImage;
  final List<String> tags;
  final VoidCallback onTap;
  final bool flipCard;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.UrlImage,
    required this.tags,
    required this.onTap,
    this.flipCard = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobileSize = screenSize.width > 600 && screenSize.height > 770;
    final theme = AppTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colors.bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colors.borderColor,
          width: 0.8,
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          if (flipCard)
            _descriptionCard(title, description, tags, onTap, theme),
          _imageCard(UrlImage, theme, isMobileSize),
          if (!flipCard)
            _descriptionCard(title, description, tags, onTap, theme),
        ],
      ),
    );
  }
}

Container _imageCard(String UrlImage, dynamic theme, final isMobileSize) {
  return Container(
      constraints: BoxConstraints(
        minHeight: 500,
      ),
      width: 570,
      decoration: BoxDecoration(
        color: theme.colors.fgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 384,
            width: 480,
            child: Image.asset(
              UrlImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ));
}

Container _descriptionCard(String title, String description, List<String> tags,
    VoidCallback onTap, dynamic theme) {
  return Container(
    constraints: BoxConstraints(
      minHeight: 500,
    ),
    width: 570,
    child: Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: TextStyle(
              color: theme.colors.textColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 25.0),

          Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.grey[800]),
          ),
          SizedBox(height: 25.0),

          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: tags.map((tag) {
              return Container(
                padding: EdgeInsets.all(6),
                child: Text(
                  tag,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                decoration: BoxDecoration(
                  color: UIColorData.gray200,
                  borderRadius: BorderRadius.circular(8),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 25.0),
          IconButton(
            onPressed: onTap,
            icon: const Icon(Icons.link),
          ),
        ],
      ),
    ),
  );
}
