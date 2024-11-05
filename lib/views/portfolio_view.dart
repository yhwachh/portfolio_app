import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:portfolio_app/core/design_system/app_ui.dart';
import 'package:portfolio_app/core/design_system/src/components/custom_animated_button.dart';
import 'package:portfolio_app/views/pages/about_me_page.dart';
import 'package:portfolio_app/views/pages/contact_page.dart';
import 'package:portfolio_app/views/pages/home_page.dart';
import 'package:portfolio_app/views/pages/left_menu.dart';
import 'package:portfolio_app/views/pages/projects_page.dart';
import 'package:portfolio_app/views/pages/skills_page.dart';

@RoutePage()
class PortfolioViewPage extends StatefulWidget {
  const PortfolioViewPage({super.key});

  @override
  State<PortfolioViewPage> createState() => _PortfolioViewPageState();
}

class _PortfolioViewPageState extends State<PortfolioViewPage> {
  late final PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: theme.colors.bgColor,
          title: Text(
            'IBA.',
            style: TextStyle(
              color: theme.colors.textColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Download CV",
                    style: TextStyle(
                      color: theme.colors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ],
        ),
        backgroundColor: theme.colors.bgColor,
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
              scrollDirection: Axis.vertical,
              children: const [
                HomePage(),
                SkillPage(),
                ProjectsPage(),
                AboutMePage(),
                ContactPage(),
              ],
            ),
            LeftMenu(
              selectedPage: _selectedIndex,
              onChanged: (index) {
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.fastOutSlowIn);
              },
            ),
          ],
        ));
  }
}
