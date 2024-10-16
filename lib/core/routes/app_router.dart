import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

final appRouter = AppRouter();

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: ARoute.page),
        AutoRoute(page: BRoute.page),
        AutoRoute(page: CRoute.page),
      ];
}
