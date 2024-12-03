import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

final appRouter = AppRouter();

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: PortfolioViewRoute.page, initial: true),
      ];
}
