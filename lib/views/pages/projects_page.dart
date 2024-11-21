import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_app/core/design_system/app_ui.dart';
import 'package:portfolio_app/core/design_system/src/components/page_title.dart';
import 'package:portfolio_app/core/design_system/src/components/project_card.dart';
import 'package:portfolio_app/providers/my_data_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class ProjectsPage extends ConsumerWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final local = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.of(context).size;
    final myDataAsyncValue = ref.watch(myDataProvider);

    return Column(
      children: [
        PageTitle(
            title: local.txt_projects,
            crossAxisAlignment: CrossAxisAlignment.end,
            alignment: Alignment.centerRight),
        const SizedBox(height: 40),
        myDataAsyncValue.when(
          data: (data) {
            return Column(
                children: data.projects.map((project) {
              var index = data.projects.indexOf(project);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProjectCard(
                  flipCard: index.isOdd,
                  title: project.title,
                  description: project.description,
                  UrlImage: project.imagePath,
                  tags: project.skills,
                  onTap: () => print("object"),
                ),
              );
            }).toList());
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ],
    );
  }
}
