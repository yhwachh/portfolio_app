import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/core/design_system/src/components/contact_me_card.dart';
import 'package:portfolio_app/core/design_system/src/components/page_title.dart';

@RoutePage()
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: screenSize.height),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PageTitle(
              title: "Contact Me",
              crossAxisAlignment: CrossAxisAlignment.center,
              alignment: Alignment.center),
          const SizedBox(height: 40),
          Wrap(
            children: [
              ContactMeCard(
                height: 60,
                width: 60,
                imagePhath: 'assets/images/linkedin2.png',
                onTap: () {
                  print("object");
                },
              ),
              SizedBox(width: 30),
              ContactMeCard(
                height: 60,
                width: 60,
                imagePhath: 'assets/images/github2.png',
                onTap: () {
                  print("object");
                },
              ),
              SizedBox(width: 30),
              ContactMeCard(
                height: 60,
                width: 60,
                imagePhath: 'assets/images/gmail2.png',
                onTap: () {
                  print("object");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
