import 'package:flutter/material.dart';
import 'package:portfolio_app/core/design_system/app_ui.dart';

class SoftSkillCard extends StatelessWidget {
  final String urlimage;
  final String title;
  final String description;

  const SoftSkillCard(
      {super.key,
      required this.title,
      required this.urlimage,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
        width: 278,
        height: 72,
        decoration: BoxDecoration(
          border: Border.all(
            color: theme.colors.borderColor,
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(urlimage),
              SizedBox(
                width: 16,
              ),
              Container(
                height: 100,
                width: 1,
                color: Colors.grey,
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: theme.colors.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                          color: theme.colors.textColor, fontSize: 10),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
