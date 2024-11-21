import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_app/core/design_system/app_ui.dart';
import 'package:portfolio_app/core/design_system/app_ui.dart';
import 'package:portfolio_app/providers/app_theme_provider.dart';
import 'package:portfolio_app/views/pages/about_me_page.dart';
import 'package:portfolio_app/views/pages/contact_page.dart';
import 'package:portfolio_app/views/pages/home_page.dart';
import 'package:portfolio_app/views/pages/left_menu.dart';
import 'package:portfolio_app/views/pages/projects_page.dart';
import 'package:portfolio_app/views/pages/skills_page.dart';
import 'package:scroll_to_id/scroll_to_id.dart';

@RoutePage()
class PortfolioViewPage extends StatefulWidget {
  const PortfolioViewPage({
    super.key,
  });

  @override
  State<PortfolioViewPage> createState() => _PortfolioViewPageState();
}

class _PortfolioViewPageState extends State<PortfolioViewPage> {
  ScrollToId scrollToId = ScrollToId();
  late final ScrollController scrollController;
  int _selectedIndex = 0;
  bool isDarkMode = false;

  void listenScroll() {
    final index = scrollToId.idPosition();
    if (index == null) return;
    setState(() {
      _selectedIndex = int.parse(index);
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(listenScroll);
    scrollToId = ScrollToId(scrollController: scrollController);
  }

  @override
  void dispose() {
    listenScroll;
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final screenSize = MediaQuery.of(context).size;
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
              child: Row(
                children: [
                  Icon(
                    Icons.light_mode,
                    color: theme.colors.textColor,
                    size: 17,
                  ),
                  Consumer(builder: (context, ref, child) {
                    return Transform.scale(
                      scale: 0.7,
                      child: SizedBox(
                        height: 20,
                        width: 40,
                        child: CupertinoSwitch(
                          // This bool value toggles the switch.
                          value: isDarkMode,
                          activeColor: Colors.black,
                          onChanged: (value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              isDarkMode = value;
                              ref.read(appThemeProvider.notifier).state =
                                  isDarkMode
                                      ? AppThemeData.dark()
                                      : AppThemeData.light();
                            });
                          },
                        ),
                      ),
                    );
                  }),
                  Icon(
                    Icons.dark_mode,
                    color: theme.colors.textColor,
                    size: 17,
                  ),
                  SizedBox(width: 30),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colors.bgColor,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Download CV",
                        style: TextStyle(
                          backgroundColor: theme.colors.bgColor,
                          color: theme.colors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: theme.colors.bgColor,
        body: Stack(
          alignment: Alignment.topRight,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
              child: InteractiveScrollViewer(
                scrollToId: scrollToId,
                children: [
                  ScrollContent(id: "0", child: HomePage()),
                  ScrollContent(id: "1", child: SkillPage()),
                  ScrollContent(id: "2", child: ProjectsPage()),
                  ScrollContent(id: "3", child: AboutMePage()),
                  ScrollContent(id: "4", child: ContactPage()),
                ],
              ),
            ),
            LeftMenu(
              selectedPage: _selectedIndex,
              onChanged: (index) {
                scrollToId.animateTo('$index',
                    duration: Duration(milliseconds: 600),
                    curve: Curves.fastOutSlowIn);
              },
            ),
          ],
        ));
  }
}
