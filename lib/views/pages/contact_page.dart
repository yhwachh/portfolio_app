import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/core/design_system/src/components/contact_me_card.dart';
import 'package:portfolio_app/core/design_system/src/components/page_title.dart';

@RoutePage()
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PageTitle(
            title: "Contact Me",
            crossAxisAlignment: CrossAxisAlignment.center,
            alignment: Alignment.center),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContactMeCard(
              imagePhath: 'assets/images/linkedin2.png',
              onTap: () {
                print("object");
              },
            ),
            SizedBox(width: 30),
            ContactMeCard(
              imagePhath: 'assets/images/github2.png',
              onTap: () {
                print("object");
              },
            ),
            SizedBox(width: 30),
            ContactMeCard(
              imagePhath: 'assets/images/gmail2.png',
              onTap: () {
                print("object");
              },
            ),
          ],
        ),
      ],
    );
  }
}
