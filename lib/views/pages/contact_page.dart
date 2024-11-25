import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_app/core/design_system/src/components/contact_me_card.dart';
import 'package:portfolio_app/core/design_system/src/components/page_title.dart';
import 'package:portfolio_app/providers/my_data_notifier.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class ContactPage extends ConsumerWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final myData = ref.watch(myDataProvider);
    final screenSize = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: screenSize.height),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PageTitle(
              title: localizations.txt_contact,
              crossAxisAlignment: CrossAxisAlignment.center,
              alignment: Alignment.center),
          const SizedBox(height: 40),
          myData.when(
            data: (myDataProvider) {
              return Wrap(
                children: [
                  ContactMeCard(
                      height: 60,
                      width: 60,
                      imagePhath: 'assets/images/linkedin2.png',
                      onTap: () async {
                        final url = myDataProvider.user.likediUrl;
                        await _launchURL(url);
                      }),
                  SizedBox(width: 30),
                  ContactMeCard(
                    height: 60,
                    width: 60,
                    imagePhath: 'assets/images/github2.png',
                    onTap: () async {
                      final url = myDataProvider.user.githubUrl;
                      await _launchURL(url);
                    },
                  ),
                  SizedBox(width: 30),
                  ContactMeCard(
                      height: 60,
                      width: 60,
                      imagePhath: 'assets/images/gmail2.png',
                      onTap: () async {
                        final url = myDataProvider.user.email;
                        await _launchURL('mailto:${url}');
                      }),
                ],
              );
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
          ),
        ],
      ),
    );
  }
  // Méthode pour lancer l'URL
  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // Si l'URL ne peut pas être ouverte, vous pouvez afficher un message d'erreur
      throw 'Could not launch $url';
    }
  }
}
