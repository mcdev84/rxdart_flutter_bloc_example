import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_dart/presentation/authentication/signin/signin.dart';
import 'package:rx_dart/presentation/home/view/home.dart';
import 'package:rx_dart/presentation/templates/page_template.dart';
// Create keys for `root` & `section` navigator avoiding unnecessary rebuilds

final _rootNavigatorKey = GlobalKey<NavigatorState>();
//final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: HomePage.routeName,
  routes: <RouteBase>[
    GoRoute(
        name: HomePage.name,
        path: HomePage.routeName,
        builder: (context, state) => const PageTemplate(child: HomePage())),
    GoRoute(
        name: SignInPage.name,
        path: SignInPage.routeName,
        builder: (context, state) => PageTemplate(child: SignInPage())),

    // StatefulShellRoute.indexedStack(
    //   builder: (context, state, navigationShell) {
    //     // Return the widget that implements the custom shell (e.g a BottomNavigationBar).
    //     // The [StatefulNavigationShell] is passed to be able to navigate to other branches in a stateful way.
    //     return SizedBox();
    //
    //     ///ScaffoldWithNavbar(navigationShell);
    //   },
    //   branches: [
    //     /// The route branch for the 1º Tab
    //     StatefulShellBranch(
    //       navigatorKey: _sectionNavigatorKey,
    //       // Add this branch routes
    //       // each routes with its sub routes if available e.g feed/uuid/details
    //       routes: <RouteBase>[
    //         // GoRoute(
    //         //   path: '/feed',
    //         //   builder: (context, state) => const FeedPage(),
    //         //   routes: <RouteBase>[
    //         //     GoRoute(
    //         //       path: 'detail',
    //         //       builder: (context, state) => const FeedDetailsPage(),
    //         //     )
    //         //   ],
    //         // ),
    //       ],
    //     ),
    //
    //     /// The route branch for 2º Tab
    //     StatefulShellBranch(routes: <RouteBase>[
    //       // Add this branch routes
    //       // each routes with its sub routes if available e.g shope/uuid/details
    //       // GoRoute(
    //       //   path: '/shope',
    //       //   builder: (context, state) => const ShopePage(),
    //       // ),  // GoRoute(
    //       //   path: '/shope',
    //       //   builder: (context, state) => const ShopePage(),
    //       // ),
    //     ])
    //   ],
    // ),  // StatefulShellRoute.indexedStack(
    //   builder: (context, state, navigationShell) {
    //     // Return the widget that implements the custom shell (e.g a BottomNavigationBar).
    //     // The [StatefulNavigationShell] is passed to be able to navigate to other branches in a stateful way.
    //     return SizedBox();
    //
    //     ///ScaffoldWithNavbar(navigationShell);
    //   },
    //   branches: [
    //     /// The route branch for the 1º Tab
    //     StatefulShellBranch(
    //       navigatorKey: _sectionNavigatorKey,
    //       // Add this branch routes
    //       // each routes with its sub routes if available e.g feed/uuid/details
    //       routes: <RouteBase>[
    //         // GoRoute(
    //         //   path: '/feed',
    //         //   builder: (context, state) => const FeedPage(),
    //         //   routes: <RouteBase>[
    //         //     GoRoute(
    //         //       path: 'detail',
    //         //       builder: (context, state) => const FeedDetailsPage(),
    //         //     )
    //         //   ],
    //         // ),
    //       ],
    //     ),
    //
    //     /// The route branch for 2º Tab
    //     StatefulShellBranch(routes: <RouteBase>[
    //       // Add this branch routes
    //       // each routes with its sub routes if available e.g shope/uuid/details
    //       // GoRoute(
    //       //   path: '/shope',
    //       //   builder: (context, state) => const ShopePage(),
    //       // ),  // GoRoute(
    //       //   path: '/shope',
    //       //   builder: (context, state) => const ShopePage(),
    //       // ),
    //     ])
    //   ],
    // ),
  ],
);
