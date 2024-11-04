import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/core/design_system/src/components/project_card.dart';

@RoutePage()
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProjectCard(
            flipCard: false,
            onTap: () {},
            tags: [
              "Flutter",
              "Dart",
              "Firebaseasdasdadasdsikhujbnhjkbhjb",
              "Firebase",
              "Firebase",
              "Firebase",
              "Firebase",
              "Firebase",
              "Firebase",
            ],
            title: "Fiskil",
            description:
                "Porem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas nec urna ac tellus volutpat viverra. Vestibulum ante rripsum primis in faucibus orci luctus et ultrices posuere cubilia curae.",
            UrlImage: "assets/images/ingush.png"),
      ],
    );
  }
}
