import 'package:animated_fab_button_menu/animated_fab_button_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/core/design_system/app_ui.dart';
import 'package:portfolio_app/providers/app_language_provider.dart';
import 'package:portfolio_app/providers/app_theme_provider.dart';
import 'package:portfolio_app/views/pages/about_me_page.dart';
import 'package:portfolio_app/views/pages/contact_page.dart';
import 'package:portfolio_app/views/pages/home_page.dart';
import 'package:portfolio_app/views/pages/left_menu.dart';
import 'package:portfolio_app/views/pages/projects_page.dart';
import 'package:portfolio_app/views/pages/skills_page.dart';
import 'package:scroll_to_id/scroll_to_id.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:html' as html;

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
  bool isEnglish = false;

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
    final locale = AppLocalizations.of(context)!;
    final theme = AppTheme.of(context);
    final screenSize = MediaQuery.of(context).size;
    final isMobileSize = screenSize.width > 680 && screenSize.height > 780;

    return Scaffold(
        floatingActionButton: (isMobileSize)
            ? null
            : FabMenu(
                fabBackgroundColor: theme.colors.textColor,
                elevation: 2.0,
                fabAlignment: Alignment.bottomRight,
                fabIcon: Icon(
                  Icons.more_horiz,
                  color: theme.colors.bgColor,
                ),
                closeMenuButton: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                overlayOpacity: 0.9,
                overlayColor: theme.colors.bgColor,
                children: [
                  MenuItem(
                    title: locale.txt_home,
                    onTap: () {
                      onCrollToId("0");
                      context.router.maybePop();
                    },
                    style: GoogleFonts.montserrat(
                      color: theme.colors.textColor
                          .withOpacity(_selectedIndex == 0 ? 1.0 : 0.3),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  MenuItem(
                    title: locale.txt_skill,
                    onTap: () {
                      onCrollToId("1");
                      context.router.maybePop();
                    },
                    style: GoogleFonts.montserrat(
                        color: theme.colors.textColor
                            .withOpacity(_selectedIndex == 1 ? 1.0 : 0.3),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  MenuItem(
                    title: locale.txt_projects,
                    onTap: () {
                      onCrollToId("2");
                      context.router.maybePop();
                    },
                    style: GoogleFonts.montserrat(
                        color: theme.colors.textColor
                            .withOpacity(_selectedIndex == 2 ? 1.0 : 0.3),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  MenuItem(
                    title: locale.txt_about_me,
                    onTap: () {
                      onCrollToId("3");
                      context.router.maybePop();
                    },
                    style: GoogleFonts.montserrat(
                        color: theme.colors.textColor
                            .withOpacity(_selectedIndex == 3 ? 1.0 : 0.3),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  MenuItem(
                    title: locale.txt_contact,
                    onTap: () {
                      onCrollToId("4");
                      context.router.maybePop();
                    },
                    style: GoogleFonts.montserrat(
                        color: theme.colors.textColor
                            .withOpacity(_selectedIndex == 4 ? 1.0 : 0.3),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: theme.colors.bgColor,
          title: Text(
            'I',
            style: GoogleFonts.playfairDisplay(
              color: theme.colors.textColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Text("EN",
                      style: GoogleFonts.montserrat(
                        color: theme.colors.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  Consumer(builder: (context, ref, child) {
                    return Transform.scale(
                      scale: 0.7,
                      child: SizedBox(
                        height: 20,
                        width: 40,
                        child: CupertinoSwitch(
                          // This bool value toggles the switch.
                          value: isEnglish,
                          activeColor: Colors.black,
                          onChanged: (value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              isEnglish = value;
                              ref.read(appLanguageProvider.notifier).state =
                                  isEnglish ? Locale('fr') : Locale('en');
                            });
                          },
                        ),
                      ),
                    );
                  }),
                  Text("FR",
                      style: GoogleFonts.montserrat(
                        color: theme.colors.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  if (isMobileSize) SizedBox(width: 15),
                  if (isMobileSize)
                    Container(
                      height: 20,
                      width: 1,
                      color: theme.colors.textColor,
                    ),
                  SizedBox(width: 15),
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
                  const SizedBox(width: 30),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colors.textColor,
                      ),
                      onPressed: () {
                        downloadFile(
                            "assets/assets/files/CV_Ibraguim_Albakov.pdf");
                      },
                      child: Text(
                        isMobileSize ? "Download CV" : "CV",
                        style: GoogleFonts.montserrat(
                          color: theme.colors.bgColor,
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
                  ScrollContent(id: "0", child: const HomePage()),
                  ScrollContent(id: "1", child: const SkillPage()),
                  ScrollContent(id: "2", child: const ProjectsPage()),
                  ScrollContent(id: "3", child: const AboutMePage()),
                  ScrollContent(id: "4", child: const ContactPage()),
                ],
              ),
            ),
            if (isMobileSize)
              LeftMenu(
                selectedPage: _selectedIndex,
                onChanged: (index) {
                  onCrollToId(index.toString());
                },
              ),
          ],
        ));
  }

  void onCrollToId(String id) {
    scrollToId.animateTo(id,
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastOutSlowIn);
  }

  downloadFile(String url) {
    try {
      html.window.open(url, 'Ibraguim CV');
      //final html.AnchorElement anchorElement = html.AnchorElement(href: url)
      //..download = "CV_Ibraguim_Albakov.pdf"
      //..target = 'blank';
      //anchorElement.click();
    } catch (e) {
      print('Erreur lors du téléchargement : $e');
    }
  }
}
