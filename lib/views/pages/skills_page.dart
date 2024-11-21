import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_app/core/design_system/app_ui.dart';
import 'package:portfolio_app/core/design_system/src/components/page_title.dart';
import 'package:portfolio_app/core/design_system/src/components/skill_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio_app/providers/my_data_notifier.dart';

class SkillPage extends ConsumerWidget {
  const SkillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.of(context).size;
    final myDataAsyncValue = ref.watch(myDataProvider);

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
              Text(
                locale.txt_skills_title,
                style: TextStyle(color: theme.colors.textColor),
              ),
              const SizedBox(height: 30),
              myDataAsyncValue.when(
                data: (data) {
                  return Wrap(
                    children: data.skills.map((skill) {
                      return SkillCard(
                        title: skill,
                        urlimage: "assets/images/$skill.png",
                      );
                    }).toList(),
                  );
                },
                loading: () => Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
