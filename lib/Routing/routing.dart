import 'package:flutter/material.dart';
import 'package:globaldispatch/Routing/route_names.dart';
import 'package:globaldispatch/Screens/AuthScreens/sign_in_page.dart';
import 'package:globaldispatch/Screens/AuthScreens/sign_up_page.dart';
import 'package:globaldispatch/Screens/HomePage/home_page.dart';
import 'package:globaldispatch/Screens/WarehousePage/warehousePage.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: RouteNames.root,
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: HomePage()

              // App.isLoggedIn ? const HomePage() : SignInPage()

              );
        },
      ),
      GoRoute(
        name: RouteNames.signIn,
        path: '/signin',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: SignInPage(),
          );
        },
      ),
      GoRoute(
          name: RouteNames.homePage,
          path: '/homepage',
          pageBuilder: (context, state) {
            return MaterialPage(
              child: HomePage(),
            );
          },
          routes: [
            GoRoute(
              name: RouteNames.warehousePage,
              path: 'warehousePage',
              pageBuilder: (context, state) {
                return MaterialPage(
                  child: WarehousePage(),
                );
              },
            ),
          ]),
      GoRoute(
        name: RouteNames.signUp,
        path: '/signup',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: SignUpPage(),
          );
        },
      ),
    ],
  );
}
