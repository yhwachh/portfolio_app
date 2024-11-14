import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_app/core/design_system/src/components/page_title.dart';
import 'package:portfolio_app/core/design_system/src/components/skill_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SkillPage extends StatelessWidget {
  const SkillPage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.of(context).size;

    final skills = [
      "Flutter",
      "Dart",
      "Firebase",
      "C++",
      "JavaScript",
      "HTML5",
      "CSS3",
      "Python",
      "Docker",
      "Github",
      "Figma",
      "Notion",
      "Slack",
    ];
    return Column(
      children: [
        PageTitle(
            alignment: Alignment.centerLeft,
            title: locale.txt_skill,
            crossAxisAlignment: CrossAxisAlignment.end),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.1,
            vertical: screenSize.height * 0.1,
          ),
          child: Column(
            children: [
              Text(locale.txt_skills_title),
              const SizedBox(height: 30),
              Wrap(
                runSpacing: 25,
                children: skills
                    .map((e) => SkillCard(
                          title: e,
                          urlimage: "assets/images/$e.png",
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
