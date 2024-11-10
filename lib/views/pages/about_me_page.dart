import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/core/design_system/src/components/page_title.dart';
import 'package:portfolio_app/core/design_system/src/components/soft_skill_card.dart';
import 'package:portfolio_app/core/design_system/src/components/experience_card.dart';
import 'package:portfolio_app/core/design_system/src/components/profile_components.dart';

@RoutePage()
class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PageTitle(
            alignment: Alignment.centerLeft,
            title: "About Me",
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          ProfileComponents(
            title: "Ibraguim Albakov",
            description:
                "Après trois années d'expérience professionnelle, j'ai entrepris une reconversion en me formant aux langages de programmation C et C++, élargissant ensuite mes compétences à Dart et Python ainsi qu'à divers frameworks web. Animé par une curiosité sans cesse renouvelée, je nourris également un intérêt grandissant pour les connexions entre la programmation et l'économie, cherchant ainsi à approfondir mes connaissances dans ces domaines complémentaires.",
            urlImage: "assets/images/profile.jpeg",
          ),
          SizedBox(height: 50),
          Wrap(alignment: WrapAlignment.center, children: [
            SoftSkillCard(
              title: "I have experience with:",
              description: "asdasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfdf",
              urlimage: "assets/images/dart.png",
            ),
            SoftSkillCard(
              title: "I have experience with:",
              description:
                  "asdasdfasdfasdfasdfasdfasdfasdfasdfawefasdfasdfasdf",
              urlimage: "assets/images/dart.png",
            ),
            SoftSkillCard(
              title: "I have experience with:",
              description: "asdasdfasdfasdfasdfasdfasdfasdfasdfasf",
              urlimage: "assets/images/dart.png",
            ),
          ]),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                ExperienceCard(
                  title: "I have experience with:",
                  experiences:
                      "asdasdfasdfasdfasdfasdfasdfasdfasdfasdfasderqwerqw",
                ),
                ExperienceCard(
                  title: "I have experience with:",
                  experiences:
                      "asdasdfasdfasdfasdfasdfasdfasdfasdfasdfasderqwe",
                ),
                ExperienceCard(
                  title: "I have experience with:",
                  experiences:
                      "asdasdfasdfasdfasdfasdfasdfasdfasdfasdfasderqwerqw",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
