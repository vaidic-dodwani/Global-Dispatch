import 'package:flutter/material.dart';
import 'package:globaldispatch/Routing/route_names.dart';

import 'package:globaldispatch/Screens/AuthScreens/add_business_details.dart';
import 'package:globaldispatch/Screens/AuthScreens/otp_page.dart';
import 'package:globaldispatch/Screens/AddnewWarehouse/newWarehouse.dart';

import 'package:globaldispatch/Screens/AuthScreens/sign_in_page.dart';
import 'package:globaldispatch/Screens/AuthScreens/sign_up_page.dart';
import 'package:globaldispatch/Screens/HomePage/home_page.dart';
import 'package:globaldispatch/Screens/WarehousePage/warehousePage.dart';
import 'package:globaldispatch/Screens/HomePage/home_page.dart';
import 'package:globaldispatch/static_classes.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: RouteNames.root,
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(
              // child: App.isLoggedIn ? const HomePage() : SignInPage());
              child: HomePage());
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
            GoRoute(
              name: RouteNames.newWarehouse,
              path: 'newwarehouse',
              pageBuilder: (context, state) {
                return MaterialPage(
                  child: NewWarehouse(),
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
          routes: [
            GoRoute(
                name: RouteNames.otp,
                path: 'otppage:/email',
                pageBuilder: (context, state) {
                  return MaterialPage(
                    child: OtpPage(
                      email: state.params['email']!,
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    name: RouteNames.businessDetails,
                    path: 'businessdetails',
                    pageBuilder: (context, state) {
                      return MaterialPage(
                        child: AddBusinessDetails(),
                      );
                    },
                  )
                ])
          ]),
    ],
  );
}
