import 'package:flutter/material.dart';
import 'package:portfolio_app/core/widgets/custom_animated_button.dart';

class LeftMenu extends StatefulWidget {
  final Function(int index) onChanged;

  LeftMenu({super.key, required this.onChanged});

  @override
  State<LeftMenu> createState() => _LeftMenuState();
}

class _LeftMenuState extends State<LeftMenu> {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAnimatedButton(
              label: "contact",
              onTap: () {
                widget.onChanged(3);
              },
            ),
            SizedBox(
              width: 30,
            ),
            CustomAnimatedButton(
              label: "projects",
              onTap: () {
                widget.onChanged(2);
              },
            ),
            SizedBox(
              width: 30,
            ),
            CustomAnimatedButton(
              label: "about me",
              onTap: () {
                widget.onChanged(1);
              },
            ),
            SizedBox(
              width: 30,
            ),
            CustomAnimatedButton(
              label: "home",
              onTap: () {
                widget.onChanged(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
