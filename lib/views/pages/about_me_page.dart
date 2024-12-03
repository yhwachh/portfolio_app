import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_app/core/design_system/src/components/page_title.dart';
import 'package:portfolio_app/core/design_system/src/components/experience_card.dart';
import 'package:portfolio_app/core/design_system/src/components/profile_component.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio_app/providers/my_data_notifier.dart';

@RoutePage()
class AboutMePage extends ConsumerWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(myDataProvider);
    final locale = AppLocalizations.of(context)!;
    final myDataAsyncValue = ref.watch(myDataProvider);

    final screenSize = MediaQuery.of(context).size;
    return userData.when(
      data: (data) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PageTitle(
                alignment: Alignment.centerLeft,
                title: locale.txt_about_me,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              SizedBox(height: 50),
              ProfileComponent(
                title: data.user.name,
                description: data.user.bio,
                urlImage: data.user.avatarPath,
              ),
              SizedBox(height: 50),
              myDataAsyncValue.when(
                data: (data) {
                  return Wrap(
                    runSpacing: 10,
                    spacing: 50,
                    children: data.experiences.map((experience) {
                      return ExperienceCard(
                        title: experience.title,
                        experiences: experience.description,
                      );
                    }).toList(),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}
