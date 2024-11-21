import 'package:flutter/material.dart';
import 'package:portfolio_app/core/design_system/src/components/custom_animated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LeftMenu extends StatefulWidget {
  final Function(int index) onChanged;
  final int selectedPage;

  LeftMenu({super.key, required this.onChanged, required this.selectedPage});

  @override
  State<LeftMenu> createState() => _LeftMenuState();
}

class _LeftMenuState extends State<LeftMenu> {
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxHeight > 700 && constraints.maxWidth > 600) {
        return _menu(
          local,
        );
      } else {
        return Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<String>(
            onSelected: (value) {},
            icon: Icon(Icons.menu),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: CustomAnimatedButton(
                  label: local.txt_home,
                  isSelected: widget.selectedPage == 0,
                  onTap: () => widget.onChanged(0),
                ),
              ),
              PopupMenuItem(
                child: CustomAnimatedButton(
                  label: local.txt_skill,
                  isSelected: widget.selectedPage == 1,
                  onTap: () => widget.onChanged(1),
                ),
              ),
              PopupMenuItem(
                child: CustomAnimatedButton(
                  label: local.txt_projects,
                  isSelected: widget.selectedPage == 2,
                  onTap: () => widget.onChanged(2),
                ),
              ),
              PopupMenuItem(
                child: CustomAnimatedButton(
                  label: local.txt_about_me,
                  isSelected: widget.selectedPage == 3,
                  onTap: () => widget.onChanged(3),
                ),
              ),
              PopupMenuItem(
                child: CustomAnimatedButton(
                  label: local.txt_contact,
                  isSelected: widget.selectedPage == 4,
                  onTap: () => widget.onChanged(4),
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  Align _menu(
    AppLocalizations local,
  ) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RotatedBox(
        quarterTurns: -1,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAnimatedButton(
              label: local.txt_contact,
              isSelected: widget.selectedPage == 4,
              onTap: () => widget.onChanged(4),
            ),
            const SizedBox(width: 30),
            CustomAnimatedButton(
              label: local.txt_about_me,
              isSelected: widget.selectedPage == 3,
              onTap: () => widget.onChanged(3),
            ),
            const SizedBox(width: 30),
            CustomAnimatedButton(
              label: local.txt_projects,
              isSelected: widget.selectedPage == 2,
              onTap: () => widget.onChanged(2),
            ),
            const SizedBox(width: 30),
            CustomAnimatedButton(
              label: local.txt_skill,
              isSelected: widget.selectedPage == 1,
              onTap: () => widget.onChanged(1),
            ),
            const SizedBox(width: 30),
            CustomAnimatedButton(
              label: local.txt_home,
              isSelected: widget.selectedPage == 0,
              onTap: () => widget.onChanged(0),
            ),
          ],
        ),
      ),
    );
  }
}
