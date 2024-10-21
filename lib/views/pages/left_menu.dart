import 'package:flutter/material.dart';
import 'package:portfolio_app/core/widgets/custom_animated_button.dart';


class LeftMenu extends StatefulWidget {
  
  LeftMenu({super.key});

  @override
  State<LeftMenu> createState() => _LeftMenuState();
}

class _LeftMenuState extends State<LeftMenu> {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child:  Align(
        alignment: Alignment.topCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, 
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAnimatedButton(label: "contact"),
            SizedBox(
              width: 30,
            ),
            CustomAnimatedButton(label: "about me"),
            SizedBox(
              width: 30,
            ),
            CustomAnimatedButton(label: "projects"),
            SizedBox(
              width: 30,
            ),
            CustomAnimatedButton(label: "home"),
          ],
        ),
      ),
    );
  }
}
